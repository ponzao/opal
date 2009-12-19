xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
    xml.channel do
        xml.title "ILMO2.0"
        xml.description "Newsfeed of cool events on ILMO2.0!"
        xml.link root_url

        for item in @newsfeed
            xml.item do
                xml.title item.message
                xml.pubDate item.created_at.to_s(:rfc822)
            end
        end
    end
end

