#!/usr/bin/env ruby

## Splay Controller ### v1.3 ###
## Copyright 2006-2011
## http://www.splay-project.org
## 
## 
## 
## This file is part of Splay.
## 
## Splayd is free software: you can redistribute it and/or modify 
## it under the terms of the GNU General Public License as published 
## by the Free Software Foundation, either version 3 of the License, 
## or (at your option) any later version.
## 
## Splayd is distributed in the hope that it will be useful,but 
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
## See the GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with Splayd. If not, see <http://www.gnu.org/licenses/>.

require_relative '../lib/common'

$log.level = Logger::INFO

if ARGV.size < 1
	puts("arguments: <job id>")
	exit
end

job_id = ARGV[0]

$db.select_all "SELECT * FROM splayd_selections WHERE job_id='#{job_id}'
		AND selected='TRUE'" do |ms|
	m = $db.select_one "SELECT * FROM splayds WHERE id='#{ms['splayd_id']}'"
	puts "#{m['ip']} #{ms['start_port']}"
end