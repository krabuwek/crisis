RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
      warden.authenticate! scope: :user
    end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

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

  config.model Article do
    configure :title do
      label "Название"
    end
    configure :content do
      label "Текст"
    end
    configure :description do
      label "Описание"
    end
    configure :published do
      label "Опубликована"
    end
    configure :user do
      label "Пользователь"
    end
    configure :tags do 
      label "Теги"
    end
    configure :illustration do
      label "Иллюстрация"
    end
    configure :created_at do
      label "Дата создания"
    end
    configure :updated_at do 
      label "Дата обновления"
    end
    configure :comments do
      label "Комментарии"
    end
  end

  config.model Comment do
    configure :content do
      label "Комментарий"
    end
    configure :user do
      label "Пользователь"
    end
    configure :article do
      label "Статья"
    end
    configure :created_at do
      label "Дата создания"
    end
    configure :updated_at do 
      label "Дата обновления"
    end
  end

  config.model Response do
    configure :comment do
      label "Комментарий"
      pretty_value do 
        value.titleize
      end

    end
    configure :content do
      label "Ответ"
    end
    configure :created_at do
      label "Дата создания"
    end
    configure :updated_at do 
      label "Дата обновления"
    end
    configure :user do
      label "Пользователь"
    end
  end

  config.model Mark do
    configure :article do
      label "Статься"
    end
    configure :user do
      label "Пользователь"
    end
    configure :created_at do
      label "Дата создания"
    end
    configure :updated_at do 
      label "Дата обновления"
    end
  end

  config.model Identity do
    visible false
  end

  config.model User do
    list do 
      field :id
      field :email
      field :role do 
        label "Роль"
      end
    end
    configure :role do
      label "Роль"
    end
  end
end