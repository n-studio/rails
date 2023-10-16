# frozen_string_literal: true

module Arel # :nodoc: all
  module OrderPredications
    def asc
      Nodes::Ascending.new self
    end

    def asc_nulls_last
      Nodes::Ascending.new(self).nulls_last
    end

    def desc
      Nodes::Descending.new self
    end

    def desc_nulls_first
      Nodes::Descending.new(self).nulls_first
    end
  end
end
