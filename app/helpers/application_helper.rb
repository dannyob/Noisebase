module ApplicationHelper

 DISALLOWED_TAGS = %w(script iframe) unless defined?(DISALLOWED_TAGS)
 def title(page_title)
    content_for(:title) do
      "#{page_title} - Noisebridge"
      end
  end
  
  
  def blacklist(html)
    # only do this if absolutely necessary
    if html.index("<")
      tokenizer = HTML::Tokenizer.new(html)
      new_text = ""

      while token = tokenizer.next
        node = HTML::Node.parse(nil, 0, 0, token, false)
        new_text << case node
                    when HTML::Tag
                      if DISALLOWED_TAGS.include?(node.name)
                        node.to_s.gsub(/</, "&LT;")
                      else
                        node.to_s
                      end
                    else
                      node.to_s.gsub(/</, "&LT;")
                    end
      end

      html = new_text
    end
    html
  end
  
end
