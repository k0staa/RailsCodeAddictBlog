xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Code-Addict"
    xml.author "Michal Kostewicz"
    xml.description "Software-Development, IT"
    xml.link "https://www.code-addict.pl"
    xml.language "pl"

    for article in @articles_rss
      xml.item do
        xml.title article.title
        xml.author "Michal Kostewicz"
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link "https://www.code-addict.pl/articles/" + article.id.to_s
        xml.guid "https://www.code-addict.pl/articles/" + article.id.to_s
        text = article.text		
        xml.description "<p>" + text + "</p>"

      end
    end
  end
end