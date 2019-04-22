class ComplexNumber
    @@calc_stats = {:add => 0, :multiply => 0}
    attr_reader :real_number, :imaginary_number

    def initialize(real=0 ,img=0)
        @real_number = real
        @imaginary_number = img
    end

    def print_complex_number
        puts "#{@real_number} + #{@imaginary_number} i"
    end

    def +(cn)
        @@calc_stats[:add]+=1
        ComplexNumber.new(@real_number+cn.real_number, @imaginary_number+cn.imaginary_number)
    end

    def *(cn)
        @@calc_stats[:multiply]+=1
        ComplexNumber.new(
            (@real_number*cn.real_number) - (@imaginary_number*cn.imaginary_number) ,
            (@real_number*cn.imaginary_number) + (@imaginary_number*cn.real_number)
            )
    end

    def bulk_add(cns)
        result = ComplexNumber.new
        cns.each do |cn|
            result = result + cn
        end
        return result
    end

    def bulk_multiply(cns)
        result = ComplexNumber.new(1,1)
        cns.each do |cn|
            result = result * cn
        end
        return result
    end

    def get_stats
        puts @@calc_stats
    end

end

x = ComplexNumber.new(1,2)
y = ComplexNumber.new(1,1)
z=ComplexNumber.new

print "X = " 
x.print_complex_number
print "Y = " 
y.print_complex_number

z=x+y
print "X + Y = "
z.print_complex_number
print "Stats: "
x.get_stats

z=x*y
print "X * Y = "
z.print_complex_number
print "Stats: "
x.get_stats


z = z.bulk_add([x,x,x])
print "X + X + X = "
z.print_complex_number
print "Stats: "
x.get_stats


z.bulk_multiply([x,x])
print "X * X * X = "
z.print_complex_number
print "Stats: "
x.get_stats

