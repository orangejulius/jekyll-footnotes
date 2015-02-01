require "jekyll/footnotes/version"

module Jekyll
  class FootnoteTag < Liquid::Tag
    def initialize(tag_name, id, tokens)
      raise(SyntaxError.new("invalid footnote ID")) if ['"', '<', '>'].any? { |c| id.include?(c) }
      @id = id.strip unless id.strip.empty?
      super
    end

    def render(context)
      if @id.nil?
        context.registers[:fn] ||= 0
        context.registers[:fn] = context.registers[:fn].next
        @id = context.registers[:fn]
      end
      "<sup><a href=\"#fn:#{@id}\" class=\"footnote\" rel=\"footnote\" id=\"fn-back:#{@id}\">#{@id}</a></sup>"
    end
  end

  class FootnoteBody < Liquid::Block
    def initialize(tag_name, id, tokens)
      raise(SyntaxError.new("invalid footnote ID")) if ['"', '<', '>'].any? { |c| id.include?(c) }
      @id = id.strip unless id.strip.empty?
      super
    end

    def render(context)
      if @id.nil?
        context.registers[:fnbody] ||= 0
        context.registers[:fnbody] = context.registers[:fnbody].next
        @id = context.registers[:fnbody]
      end
      context.stack do
        body = super
        "<li id=\"fn:#{@id}\" class=\"footnotebody\" value=\"#{@id}\">#{body}<a href=\"#fn-back:#{@id}\" class=\"backlink\">⏎</a></li>"
      end
    end
  end

  class FootnoteList < Liquid::Block
    def render(context)
      context.stack do
        body = super
        "<ol class=\"footnotelist\">#{body}</ol>"
      end
    end
  end

  Liquid::Template.register_tag('fn', Jekyll::FootnoteTag)
  Liquid::Template.register_tag('footnotes', FootnoteList)
  Liquid::Template.register_tag('fnbody', FootnoteBody)
end
