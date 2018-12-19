module UsersHelper
    def choose_edit_or_new
        if action_name == 'new' 
          user_path
        elsif action_name == 'edit'
          user_path
        end
      end  
end