module PostsHelper
    def render_with_hashtag(caption)
        caption.gsub(/[#][\w\p{Han}ぁ-んぁ-ヶｦ-ﾟー]+/){ |word| link_to word, "/posts/hashtag/#{word.delete("#")}" }.html_safe
    end
end
