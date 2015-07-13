ActiveAdmin.register Notification do
#controller.authorize_resource

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  # end
# create_table :notifications do |t|
#      t.string :title
#      t.string :description
#      t.string :exam_date
#      t.string :form_date
#      t.string :last_date
#      t.string :link1
#      t.string :link2
#      t.attachment :image

#      t.timestamps null: false

  menu priority: 4

  # ---------------------------------------------------------------------------------------- #

  permit_params :title,:description,:link1,:link2,:link1_name,:link2_name,:exam_date,:form_date,:result_date,:notification_review
  # ---------------------------------------------------------------------------------------- #

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Notification Details" do
      f.input :title
      f.input :description
      f.input :exam_date
      f.input :form_date
      f.input :result_date
      f.input :link1_name
      f.input :link1
      f.input :link2_name
      f.input :link2
      # f.inputs do
      #   f.has_many :finds, heading: 'Finds', allow_destroy: true, new_record: 'Add Find' do |find_f|
      #     # find_f.inputs
      #     find_f.input :image_remote_url, :as => :string
      #     find_f.input :product_name
      #     find_f.input :product_url
      #     find_f.input :shop_domain, label: "Name of the website"
      #     find_f.input :price
      #   # find_f.input :image, hint: find_f.find.image? ? image_tag(f.post.image.url, height: '200') : content_tag(:span, "Upload JPG/PNG/GIF image")
      #   end
      # end
    end
    f.actions
  end

  # ---------------------------------------------------------------------------------------- #

  index do
      column :title
      column :description
      actions
  end

  # ---------------------------------------------------------------------------------------- #

  show do |notification|
   attributes_table do
      # Will display the image on show object page
    row :id
    row :title
    row :description 
    row :exam_date
    row :form_date
    row :result_date
    row :link1_name
    row :link1
    row :link2_name
    row :link2
    row :created_at
    row :updated_at 

    end
  end

  # ---------------------------------------------------------------------------------------- #

  

  # ---------------------------------------------------------------------------------------- #

  controller do

    def create
      @notification =Notification.new(permitted_params[:notification])
      if @notification.save
        redirect_to admin_notification_path(@notification.id), :flash => { :error => @notification.errors.full_messages.join(', ') }
      else
        redirect_to admin_notifications_path, :flash => { :error => @notification.errors.full_messages.join(', ') }
      end
    end

    def update
      # Good
      @notification = Notification.find(permitted_params[:id])
      @id = permitted_params[:id]
      @notification.update_attributes(permitted_params[:notification])
      redirect_to admin_notification_path(@id), :flash => { :error => @notification.errors.full_messages.join(', ') }
    end
  end

  # ---------------------------------------------------------------------------------------- #

end

