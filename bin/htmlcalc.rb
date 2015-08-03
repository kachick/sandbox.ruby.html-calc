#!/usr/bin/env ruby
# coding: us-ascii
# Copyright (c) 2015 Kenichi Kamiya

require_relative '../lib/calc'

class HTMLCalc
  HEADER = { 'Content-Type' => 'text/html' }.freeze

  COMMANDS = {
    numbers: ('0'..'9').to_a,
    functions: %w[= + - * / C AC]
  }
  
  def forms(history)
    ret = ''

    COMMANDS.each_pair do |role, cmds|
      ret << %Q!<div class="#{role}">!
      cmds.each do |cmd|
        ret << %Q!
        <form method="POST">
          <input type="submit" name="command" value="#{cmd}" />
          <input type="hidden" name="history" value="#{history}" />
        </form>
        !
      end
      ret << '</div>'
    end
    
    ret
  end
  
  def display(n)
    %Q!<textarea name="display" rows="1" cols="100">#{n}</textarea>!
  end
  
  def html(body)
    %Q!<html>
        <head>
          <link href="style.css" rel="stylesheet" type="text/css" />
        </head>
        <body>
          #{body}
        </body>
      </html>!
  end

  def call(env)
    req = Rack::Request.new env
    case env['REQUEST_METHOD']
    when 'GET'
      [
        200,
        HEADER,
        [html(display(0) + forms(''))]
      ]
    when 'POST'
      commands = req.params['history'] + req.params['command']
      result = Calc.run commands
      
      [
        200,
        HEADER,
        [html(display(result) + forms(commands))]
      ]
    end
  end
end
