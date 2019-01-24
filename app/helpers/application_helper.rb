module ApplicationHelper

    def user_cannot_access_content
        !user_signed_in? || current_user.role == 'member'
    end

    def current_user_is_the_author
        user_signed_in? && current_user == @article.user
    end

    def current_user_is_a_subscriber
        user_signed_in? && current_user.role == 'subscriber'
    end

    def user_is_a_visitor
        !user_signed_in?
    end

    def user_is_a_member
        user_signed_in? && current_user.role == 'member'
    end

    def user_is_a_journalist
        user_signed_in? && current_user.role == 'journalist'
    end

    def user_can_write_article
        user_signed_in? && current_user.role == 'journalist' || current_user.role == 'editor'
    end

    def user_is_a_editor
        user_signed_in? && current_user.role == 'editor'
    end

end
