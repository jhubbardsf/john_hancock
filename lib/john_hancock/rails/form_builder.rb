module JohnHancock
  module Rails
    module FormBuilder
      include ActionView::Helpers::TagHelper

      def signature_canvas
        content_tag(:canvas, nil, id: 'JohnHancock-canvas', class: 'JohnHancock-canvas')
      end

      def hidden_signature_field(attribute)
        hidden_field(attribute.to_sym, id: 'JohnHancock-hidden', class: 'JohnHancock-hidden')
      end

      def clear_field

      end


      def signature_field(attribute)
        tags = []
        tags << signature_canvas
        tags << hidden_signature_field(attribute)
        tags.join(' ').html_safe
      end
    end
  end
end

JohnHancock::FormBuilder = JohnHancock::Rails::FormBuilder