class Parsing < ActiveRecord::Base

  validates :name, presence: true
  validates :html_resource, presence: true

  def parse(source)
    doc = Nokogiri::HTML(open(source, 'User-Agent' => 'firefox'))
    t = doc.css('.tags').to_html
    i = doc.css('.infopanel_wrapper').to_html
    doc.css('.post_show').to_html.gsub!(i,'').gsub!(t,'')
  end

end
