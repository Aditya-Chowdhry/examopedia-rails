ActiveAdmin.register Article do


  menu priority: 5

  # ---------------------------------------------------------------------------------------- #

  permit_params :title,:body,:image,:author_name,:author_link,:tags,:likes,:article_review
  # ---------------------------------------------------------------------------------------- #

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Aricle Details" do
      f.input :title
      # Will preview the image when the object is edited
      f.input :image
      f.input :body
      f.input :author_name
      f.input :author_link
      f.input :tags
      f.input :likes
      if current_admin_user.role=="admin"
      f.input :article_review,as: :boolean,:label=> "Check=>Pending Uncheck=>Approve"
      end

    end
    f.actions
  end

  # ---------------------------------------------------------------------------------------- #

  index do
      column :title

      column  :image do |article|
      article.image? ? image_tag(article.image.url, height: '100') : content_tag(:span, "No photo yet")
    end
      column :body
      column :tags
      column :likes
      actions
  end

  # ---------------------------------------------------------------------------------------- #

  #  show do |post|
  #   attributes_table do
      # Will display the image on show object page
  #    row :id
   #   row :title
    #  row :image do
    #    post.image? ? image_tag(post.image.url, height: '200') : content_tag(:span, "No photo yet")
    #  end
    #  row :post_type
    #  row :finds
    #  row :tag_list
    #  row :description
    # row :ideal_price

    show do |article|
      attributes_table do

      row :id
      row :title
      row :image
      row  :image do |article|
      article.image? ? image_tag(article.image.url, height: '100') : content_tag(:span, "No photo yet")
      end
      row :body
      row :tags
      row :likes
      row :author_name
      row :author_link
      row :created_at
      row :updated_at
      #comments=Comment.find(:id)
      #row :comments

    end

  end
  # ---------------------------------------------------------------------------------------- #



  # ---------------------------------------------------------------------------------------- #

  controller do

    def create
      @article =Article.new(permitted_params[:article])
      if @article.save
        redirect_to admin_article_path(@article.id), :flash => { :error => "Successfully created" }
      else
        redirect_to admin_articles_path, :flash => { :error => @article.errors.full_messages.join(', ') }
      end
    end

    def update

      @article = Article.find(permitted_params[:id])
      if current_admin_user.role=="moderator"
        if !@article.article_review?
          redirect_to admin_articles_path,:flash => { :error =>"You cannot edit an approved article" }
          return
          #redirect doesn't endthe action. So to end the action one can use return
        end
      end
      @id = permitted_params[:id]
      if @article.update_attributes(permitted_params[:article])
       redirect_to admin_article_path(@id),:flash => { :error =>"Successfully Updated" }
      else
      redirect_to admin_article_path(@id), :flash => { :error =>"Error Occured try again." }
      end
    end
  end

  # ---------------------------------------------------------------------------------------- #

  end
