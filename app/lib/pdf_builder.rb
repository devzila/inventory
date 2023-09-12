class PdfBuilder
  def initialize(template, assigns, layout='pdf',  options = {})
    @template = template
    @assigns = assigns
    @layout = layout
    @options = {
      orientation: :portrait,
      page_size:   'A4',
      footer: { center: '- [page] -' },
      margin: { top: 6, bottom: 6, left: 4, right: 4 }
    }.merge(options)
  end

  def content
    ActionController::Base.new().render_to_string(
      template: @template,
      assigns: @assigns,
      layout: @layout
    )
  end

  def binary_content
    WickedPdf.new.pdf_from_string(content, @options)
  end
end