# Exercise: Bidding System

## Objective
Complete the given `Bidding` class that will be used for a bidding system.

## Classes Overview

### Agent
The `Agent` class is a placeholder for an agent participating in the bidding. This class will already be implemented and is not part of this exercise.

#### Methods
- `initialize`: Initializes a new agent.
- `get_bid_increase`: Returns the amount (integer) by which the agent wants to increase its bid. This method will already be implemented and is not part of this exercise.

### Bidding
The `Bidding` class handles the bidding process among agents.

#### Attributes
- `bids`: An array to store the current bids of each agent.
- `active_agents`: An array to keep track of agents who are still active in the bidding process.
- `highest_bid`: The current highest bid in the bidding process.

#### Methods
- `initialize(agents)`: Initializes the bidding process with a list of agents. Sets initial bids to 0, duplicates the list of agents for active agents, and initializes the highest bid to 0.
- `run`: Runs the bidding process. Agents place their bids until the bidding is complete.
- `process_agent_bid(agent, idx)`: Processes the bid of a given agent at the specified index. If the agent's current bid is less than the highest bid, the agent increases their bid. If the new bid is equal to or exceeds the highest bid, it updates the highest bid. Otherwise, the agent withdraws from the bidding.
- `set_highest_bid(agent, idx)`: Sets the highest bid and the highest bidder if the current bid of the agent is higher than the existing highest bid.
- `withdraw_agent(agent)`: Removes the agent from the active agents list.
- `bidding_complete?`: Checks if the bidding is complete. The bidding is complete when all active agents have the highest bid or there are no active agents left.

## Exercise Instructions
1. **Implement `process_agent_bid` Method:**
   - Ensure the agent's bid is processed correctly.
   - Update the agent's bid if the bid increase makes their total bid equal to or higher than the highest bid.
   - Withdraw the agent if their bid increase does not reach the highest bid.

2. **Implement `set_highest_bid` Method:**
   - Update the highest bid and the highest bidder if the agent's new bid is higher than the current highest bid.

3. **Implement `withdraw_agent` Method:**
   - Remove the agent from the list of active agents.

4. **Implement `bidding_complete?` Method:**
   - Return `true` if all active agents have bids equal to the highest bid and there are still active agents.
   - Return `false` otherwise.

### Example Usage
```ruby
class Agent
  def initialize(name)
    @name = name
  end

  def get_bid_increase
    # This method will be implemented by the Agent class
    rand(1..10) # For example, returning a random bid increase
  end

  def to_s
    @name
  end
end

agents = [Agent.new("Agent 1"), Agent.new("Agent 2"), Agent.new("Agent 3")]
bidding = Bidding.new(agents)
bidding.run

puts "Highest Bid: #{bidding.highest_bid}"
puts "Bids: #{bidding.bids}"
puts "Active Agents: #{bidding.active_agents}"
