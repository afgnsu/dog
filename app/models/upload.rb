require 'RMagick'

class Upload < ActiveRecord::Base
  belongs_to :dog
  #before_save :remove_blank_fields

  has_attached_file :photo,
                    :styles => {
                      :thumb => ["100x100", :jpg],
                      :pagesize => ["500x400", :jpg],
                    },
                    :default_style => :pagesize

  attr_accessor :x1, :y1, :width, :height

  def update_attributes(att)

    scaled_img = Magick::ImageList.new(self.photo.path)
    orig_img = Magick::ImageList.new(self.photo.path(:original))
    scale = orig_img.columns.to_f / scaled_img.columns

    args = [ att[:x1], att[:y1], att[:width], att[:height] ]
    args = args.collect { |a| a.to_i * scale }

    orig_img.crop!(*args)
    orig_img.write(self.photo.path(:original))

    self.photo.reprocess!
    self.save

    super(att)
  end

  #private
  #before_save :remove_blank_fields
    def remove_blank_fields
      self.delete self.select { |upload| upload.description.blank? }
    end
end
