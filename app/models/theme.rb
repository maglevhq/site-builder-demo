class Theme

  def self.first
    all.first
  end

  def self.all
    [
      Maglev.local_themes.find { |theme| theme.id == 'slick' },
      Maglev.local_themes.find { |theme| theme.id == 'default' },
    ]
  end

end