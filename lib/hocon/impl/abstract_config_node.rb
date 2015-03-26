# encoding: utf-8

require 'hocon/impl'
require 'hocon/config_node'
require 'hocon/config_error'

class Hocon::Impl::AbstractConfigNode < Hocon::ConfigNode
  def tokens
    raise Hocon::ConfigError::ConfigBugOrBrokenError, "subclasses of AbstractConfigNode should override `tokens` (#{self.class})"
  end

  def render
    orig_text = StringIO.new
    tokens.each do |t|
      orig_text << t.token_text
    end
    orig_text.string
  end

  def ==(other)
    other.is_a?(Hocon::Impl::AbstractConfigNode) &&
        (render == other.render)
  end

  def hash
    render.hash
  end
end
