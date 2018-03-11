module JohnHancock
  module Rails
    module FormBuilder
      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::FormTagHelper

      def signature_canvas
        content_tag(:canvas, nil, id: 'JohnHancock-canvas', class: 'JohnHancock-canvas')
      end

      def hidden_signature_field(attribute)
        hidden_field(attribute.to_sym, id: 'JohnHancock-hidden', class: 'JohnHancock-hidden')
      end

      def clear_field
        button_tag 'Clear', type: 'button', class: 'button clear', data: { action: 'canvas-clear' }
      end


      def signature_field(attribute)
        tags = []
        tags << signature_canvas
        tags << hidden_signature_field(attribute)
        tags << clear_field
        tags.join(' ').html_safe
      end
    end
  end
end

JohnHancock::FormBuilder = JohnHancock::Rails::FormBuilder