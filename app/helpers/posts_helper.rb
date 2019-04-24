module PostsHelper
    def render_with_hashtag(caption)
        caption.gsub(/[#＃][Ａ-Ｚａ-ｚA-Za-z一-鿆0-9０-９ぁ-ヶｦ-ﾟー]+/){ |word| link_to word, "/posts/hashtag/#{word.delete("#＃")}" }.html_safe
    end
    def extraction_hashtag(caption)
        caption.scan(/[#＃][Ａ-Ｚａ-ｚA-Za-z一-鿆0-9０-９ぁ-ヶｦ-ﾟー]+/).map(&:strip)
    end
end
