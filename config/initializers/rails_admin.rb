RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  # RailsAdmin.config do |config|
  #   config.authorize_with do |controller|
  #     unless current_user.role == 'admin'
  #       redirect_to main_app.root_path
  #       flash[:error] = "You are not an admin"
  #     end
  #   end
  # end



  # Model
  config.included_models = %w[ User Profession State City DataSheet]

  config.model "DataSheet" do 
    edit do
      field :excel_file, :active_storage do 
        
      end
      configure :admin do
        visible false
      end
      field :admin_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end
  end

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
