class Trend < ActiveRecord::Base

  def self.livedoor_news
    Trend.delete_all
    agent = Mechanize.new
    page = agent.get("http://news.livedoor.com/")
    page.search('.topicsList a').each do |ele|
      title = ele.inner_text
      url =  ele.get_attribute('href')
      trend = Trend.where(title: title).first_or_initialize
      trend.url = url
      trend.save
    end
  end

end
