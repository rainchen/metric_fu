class MetricFu::RoodiHotspot < MetricFu::Hotspot

  COLUMNS = %w{problems}

  def columns
    COLUMNS
  end

  def name
    :roodi
  end

  def map(row)
    MetricFu::HotspotScoringStrategies.present(row)
  end

  def reduce(scores)
    MetricFu::HotspotScoringStrategies.sum(scores)
  end

  def score(metric_ranking, item)
    MetricFu::HotspotScoringStrategies.percentile(metric_ranking, item)
  end

  def generate_records(data, table)
    return if data==nil
    Array(data[:problems]).each do |problem|
      table << {
        "metric" => name,
        "problems" => problem[:problem],
        "file_path" => problem[:file]
      }
    end
  end

  def present_group(group)
    occurences = group.size
    "found #{occurences} design problems"
  end

end
