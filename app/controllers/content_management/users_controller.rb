class ContentManagement::UsersController < ApplicationController
    before_action :authenticate_user!, :require_to_be_editor
    def index
        @users = User.all
    end

    def update
        user = User.find(params[:id])
        user.update_attribute(:role, user.role == 'member' ? 'journalist' : 'member')
        redirect_to content_management_users_path, notice: 'Updated Successfully!'
    end

    def require_to_be_editor
        unless current_user.editor?
            redirect_to root_path 
        end
    end

end