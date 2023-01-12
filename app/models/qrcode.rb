class Qrcode < ApplicationRecord
  has_one_attached :qr_code
  belongs_to :user
  #after_create :generate_qr

  include Rails.application.routes.url_helpers

  require 'qrcode'
  require 'prawn'
  require 'prawn/measurement_extensions'


  # def generate_qr(params)
  #   pdf = Prawn::Document.new(page_size: [40.mm, 25.mm], margin: [10,10,10,10])
  #   pdf.font_size 8
  #   puts "generating QR code for: #{params}"
  #   qrcode_content = params
  #   if !qrcode_content.empty?
  #     qrcode = RQRCode::QRCode.new(params, level: :h, size: 4)
  #     pdf.move_down(5)
  #     pdf.render_qr_code(qrcode, dot: 1.2, align: :left)
  #     pdf.move_up(20)
  #     pdf.indent(55) do
  #       pdf.text qrcode_content
  #     end
  #     pdf.start_new_page
  #   end
  #   pdf.render_file("sample.pdf")
  # end

  def generate_qr(params)
    qr_url = url_for(controller: 'qrcodes',
            action: 'show_order',
            id: self.id,
            only_path: false,
            host: 'http://localhost:3000/show_order',
            source: params)
    qrcode = RQRCode::QRCode.new(qr_url)

    png = qrcode.as_png(
          bit_depth: 1,
          border_modules: 4,
          color_mode: ChunkyPNG::COLOR_GRAYSCALE,
          color: "black",
          file: nil,
          fill: "white",
          module_px_size: 6,
          resize_exactly_to: false,
          resize_gte_to: false,
          size: 120
    )
    image_name = SecureRandom.hex
    IO.binwrite("tmp/#{image_name}.png", png.to_s)
    blob = ActiveStorage::Blob.create_after_upload!(
      io: File.open("tmp/#{image_name}.png"),
      filename: image_name,
      content_type: 'png'
    )
    self.qr_code.attach(blob)
  end
end
