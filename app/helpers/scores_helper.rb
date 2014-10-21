module ScoresHelper
  def avatar_for(score, total_items)
    case score
      when 0
        image_tag 'best.png'
      when total_items - 1
        image_tag 'worst.png'
      else
        image_tag 'middle.png'
    end
  end
end
