== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

image uploading using paperclip

gem 'paperclip', '~> 4.2.1'

rails g paperclip pin image

add below code in pin model

has_attached_file :image, :styles => { :medium => "300x300>" }, :default_url => "missing.png"
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

add missing.png in assets/images
index.html

= link_to (image_tag pin.image.url(:medium)), pin_path(pin)
_form.html
		= f.input :image,input_html: { class: 'form-control' }
edit.html
	= image_tag @pin.image.url(:medium) #if we want to see editing image



gem 'masonry-rails', '~> 0.2.4'
add application.js
//= require masonry/jquery.masonry 
add pin.coffee
$ ->
	$("#pins").imagesLoaded ->	
  		$("#pins").masonry
      		itemSelector: '.box',
      		isFitWidth: true
added styles in application.css.scss