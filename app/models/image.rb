class Image < Struct.new(:year, :dim, :num, :small)
  def src
    "/images/#{year}/#{dim}/#{file}"
  end

  def file
    "%s%03d.jpg" % [small ? 's' : '', num]
  end

  def path
    "/image?year=#{year}&dim=#{dim}&num=#{num}".html_safe
  end

  def alt
    "picture #{year}.#{num}"
  end

  def next
    if self.class.check_num(year, dim, num + 1) == num + 1
      self.class.new(year, dim, num + 1)
    else
      dims = self.class.allowed_dims(year)
      index = dims.index(dim)
      if index && index + 1 < dims.size
        next_dim = dims[index + 1]
        next_num = self.class.allowed_files(year, next_dim).first.to_i
        self.class.new(year, next_dim, next_num)
      else
        years = self.class.allowed_years
        index = years.index(year)
        if index && index + 1 < years.size
          next_year = years[index + 1]
          next_dim = self.class.allowed_dims(next_year).first
          next_num = self.class.allowed_files(next_year, next_dim).first.to_i
          self.class.new(next_year, next_dim, next_num)
        else
          nil
        end
      end
    end
  end

  def prev
    if self.class.check_num(year, dim, num - 1) == num - 1
      self.class.new(year, dim, num - 1)
    else
      dims = self.class.allowed_dims(year)
      index = dims.index(dim)
      if index && index > 0
        prev_dim = dims[index - 1]
        prev_num = self.class.allowed_files(year, prev_dim).last.to_i
        self.class.new(year, prev_dim, prev_num)
      else
        years = self.class.allowed_years
        index = years.index(year)
        if index && index > 0
          prev_year = years[index - 1]
          prev_dim = self.class.allowed_dims(prev_year).last
          prev_num = self.class.allowed_files(prev_year, prev_dim).last.to_i
          self.class.new(prev_year, prev_dim, prev_num)
        else
          nil
        end
      end
    end
  end

  class << self
    def check(y, d, n)
      year = check_year(y)
      dim = check_dim(year, d)
      num = check_num(year, dim, n)
      new(year, dim, num)
    end

    def check_year(year)
      allowed = allowed_years()
      allowed.include?(year.to_i) ? year.to_i : allowed.first
    end

    def check_dim(year, dim)
      allowed = allowed_dims(year)
      allowed.include?(dim) ? dim : allowed.first
    end

    def check_num(year, dim, num)
      allowed = allowed_files(year, dim)
      file = "%03d.jpg" % num.to_i
      allowed.include?(file) ? num.to_i : allowed.first.to_i
    end

    def allowed_years
      image_dir
        .glob("20[0-9][0-9]")
        .map(&:basename)
        .map(&:to_s)
        .map(&:to_i)
        .select { |year| (year >= 2016 && year <= 2019) || (year >= 2023 && year <= 2025) }
        .sort
    end

    def allowed_dims(year)
      case year
      when 2023
        ["800x500", "800x800", "800x1100"] # just to get the order right
      else
        image_dir(year)
          .glob("*x*")
          .map(&:basename)
          .map(&:to_s)
          .select { |dim| dim.match?(/\A\d+x\d+\z/) }
          .sort
      end
    end

    def allowed_files(year, dim)
      image_dir(year, dim)
        .glob("[0-9][0-9][0-9].jpg")
        .map(&:basename)
        .map(&:to_s)
        .sort
    end

    def image_dir(year=nil, dim=nil)
      path = Rails.root + "public" + "images"
      path += year.to_s if year
      path += dim if dim
      path
    end
  end
end
