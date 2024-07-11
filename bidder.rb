require_relative 'agent'

class Bidding
  attr_accessor :bids, :active_agents, :highest_bid

  def initialize(agents)
    @agents = agents
    @bids = Array.new(@agents.size, 0)
    @active_agents = @agents.dup
    @highest_bid = 0
    @highest_bidder = nil
  end

  def run
    while (!bidding_complete?)
      active_agents.each_with_index do |agent, idx|
        process_agent_bid(agent, idx)
        return if bidding_complete?
      end
    end
  end

  private

  def process_agent_bid(agent, idx)
    return unless bids[idx] < highest_bid

    bid_increase = agent.get_bid_increase
    if bid_increase + bids[idx] >= highest_bid
      @bids[idx] += bid_increase
      set_highest_bid(agent, idx)
    else
      withdraw_agent(agent)
    end
  end

  def set_highest_bid(agent, idx)
    return unless bids[agent] > highest_bid

    @highest_bid = bids[agent] 
    @highest_bidder = agent
  end

  def withdraw_agent(agent)
    @active_agents.delete(agent)
  end

  def bidding_complete?
    active_agents.each_with_index.all? { |agent, index| 
      bids[index] == highest_bid
    } && !active_agents.empty?
  end
end
