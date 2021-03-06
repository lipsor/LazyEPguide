require 'mechanize'

agent = Mechanize.new
page = agent.get 'http://epguides.com/MenatWork'
list_page = agent.click(page.link_with(:text => 'list as.csv'))
csv = list_page.parser.xpath('/html/body/pre')
show_info = csv.children.to_s.split(/\r?\n/)
show_info.shift
episodes = show_info.map { |x| x.split(',') }
