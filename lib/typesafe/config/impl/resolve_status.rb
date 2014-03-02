require 'typesafe/config/impl'

class Typesafe::Config::Impl::ResolveStatus
  UNRESOLVED = 0
  RESOLVED = 1

  def self.from_values(values)
    if values.any? { |v| v.resolve_status == UNRESOLVED }
      UNRESOLVED
    else
      RESOLVED
    end
  end

  def self.from_boolean(resolved)
    resolved ? RESOLVED : UNRESOLVED
  end
end