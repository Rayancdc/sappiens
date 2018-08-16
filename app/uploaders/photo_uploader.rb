class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick # <- Notice this

  storage :fog                    # <- and this

  process resize_to_fit: [400, 400]


  version :standard do
    resize_to_fill 250, 300
  end

  version :avatar do
    resize_to_fill 50, 50
  end
end
