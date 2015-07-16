ActiveAdmin.register Exam do
  #controller.authorize_resource
#Active admin resource
#http://activeadmin.info/docs/2-resource-customization.html

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

# create_table :exams do |t|
   #   t.string :title
   #   t.string :description
   #   t.integer :section
   #   t.integer :level
   #   t.attachment :image
   #   t.datetime :exam_date
   #   t.date :form_release_date
   #   t.date :form_last_date
   #   t.string :link1_name
   #   t.string :link1
   #   t.string :link2_name
   #   t.string :link2
   #   t.string :link3_name
   #   t.string :link3
   #  t.string :link4_name
   #   t.string :link4
   # t.integer  "gen_fees_boys"
   # t.integer  "gen_fees_girls"
   # t.integer  "sc_fees_boys"
   # t.integer  "sc_fees_girls"
   # t.string   "others_note"
   # t.integer  "others"
  #    t.timestamps null: false
  # 
  menu priority: 3

  # ---------------------------------------------------------------------------------------- #

  permit_params :title,:description,:image,:section,:level,:link1,:link2,:link3,:link4,:link1_name,:link2_name,:link3_name,:link4_name,:exam_date,:form_release_date,:form_last_date,:exam_review,:gen_fees_boys,:gen_fees_girls,:sc_fees_girls,:sc_fees_boys,:others_note,:others
  # ---------------------------------------------------------------------------------------- #

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Exam Details" do
      f.input :title
      # Will preview the image when the object is edited
      f.input :image
      f.input :description
      f.input :section, as: :select, collection: Exam.sections.keys
      f.input :level, as: :select, collection: Exam.levels.keys
      f.input :exam_date
      f.input :form_last_date
      f.input :form_release_date
      f.input :link1_name
      f.input :link1
      f.input :link2_name
      f.input :link2
      f.input :link3_name
      f.input :link4_name
      f.input :link4
      f.input :gen_fees_boys , :label => "Gen Boys fees-integer"
      f.input :gen_fees_girls ,:label => "Gen Girls fees-integer"
      f.input :sc_fees_boys , :label => "Sc/st/obc Boys Fees -integer"
      f.input :sc_fees_girls, :label => "Sc/st/obc Girls Fees -integer"
      f.input :others_note ,:label => "Some other fees if given. Give name of fees-string."
      f.input :others, :label => "Other fees-integer . (If other fees given)"
      if current_admin_user.role=="admin"
      f.input :exam_review,as: :boolean,:label=> "Check=>Pending Uncheck=>Approve"
      end
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
      column :image
      column  :image do |exam|
      exam.image? ? image_tag(exam.image.url, height: '100') : content_tag(:span, "No photo yet")
    end
      column :description
      column :section
      column :level
      column :exam_date
      column :form_last_date
      column :form_release_date
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

    show do |exam|
      attributes_table do
   
      row :id
      row :title
      row :image
      row  :image do |exam|
      exam.image? ? image_tag(exam.image.url, height: '100') : content_tag(:span, "No photo yet")
      end
      row :description
      row :section
      row :level
      row :exam_date
      row :form_last_date
      row :form_release_date
      row :link1_name
      row :link1
      row :link2_name
      row :link2
      row :link3_name
      row :link4_name
      row :link4
      row :gen_fees_boys
      row :gen_fees_girls
      row :sc_fees_boys
      row :sc_fees_girls
      row :others_note
      row :others
      
      row :created_at
      row :updated_at 

    end
  
end
  # ---------------------------------------------------------------------------------------- #

  

  # ---------------------------------------------------------------------------------------- #

  controller do

    def create
      @exam =Exam.new(permitted_params[:exam])
      if @exam.save
        redirect_to admin_exam_path(@exam.id), :flash => { :error => "Successfully created" }
      else
        redirect_to admin_exams_path, :flash => { :error => @exam.errors.full_messages.join(', ') }
      end
    end

    def update
      
      @exam = Exam.find(permitted_params[:id])
      if current_admin_user.role=="moderator"
        if !@exam.exam_review?
          redirect_to admin_exams_path,:flash => { :error =>"You cannot edit an approved exam" }
          return
          #redirect doesn't endthe action. So to end the action one can use return
        end
      end  
      @id = permitted_params[:id]
      if @exam.update_attributes(permitted_params[:exam])
       redirect_to admin_exam_path(@id),:flash => { :error =>"Successfully Updated" }
      else
      redirect_to admin_exam_path(@id), :flash => { :error =>"Error Occured try again." }
      end
    end
  end

  # ---------------------------------------------------------------------------------------- #

end

