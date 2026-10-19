module ORTools
  class Comparison
    attr_reader :left, :op, :right

    def initialize(left, op, right)
      @left = left.is_a?(Comparison) ? left : Expression.to_expression(left)
      @op = op
      @right = right.is_a?(Comparison) ? right : Expression.to_expression(right)
    end

    def >(other)
      Comparison.new(self, :>, other)
    end

    def <(other)
      Comparison.new(self, :<, other)
    end

    def >=(other)
      Comparison.new(self, :>=, other)
    end

    def <=(other)
      Comparison.new(self, :<=, other)
    end

    def ==(other)
      Comparison.new(self, :==, other)
    end

    def !=(other)
      Comparison.new(self, :!=, other)
    end

    def inspect
      "#{@left.inspect} #{@op} #{@right.inspect}"
    end
    alias_method :to_s, :inspect
  end
end
