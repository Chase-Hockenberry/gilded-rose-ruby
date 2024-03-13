class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    update_quality
    update_days_remaining unless sulfuras?
  end

  def update_quality
    return if sulfuras?

    if backstage_pass?
      update_backstage_pass_quality
    elsif aged_brie?
      increase_quality
    else
      decrease_quality
    end
  end

  def update_backstage_pass_quality
    if days_remaining > 10
      increase_quality_by(1)
    elsif days_remaining > 5
      increase_quality_by(2)
    elsif days_remaining > 0
      increase_quality_by(3)
    else
      @quality = 0
    end
  end

  def decrease_quality
    return if quality == 0

    if days_remaining <= 0
      decrease_quality_by(2)
    else
      decrease_quality_by(1)
    end
  end

  def increase_quality
    increase_quality_by(1) if quality < 50
  end

  def decrease_quality_by(value)
    @quality -= value
  end

  def increase_quality_by(value)
    @quality += value
  end

  def update_days_remaining
    @days_remaining -= 1
  end

  def aged_brie?
    name == "Aged Brie"
  end

  def backstage_pass?
    name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def sulfuras?
    name == "Sulfuras, Hand of Ragnaros"
  end
end
