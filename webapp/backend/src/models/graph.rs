use sqlx::FromRow;
use std::cmp::Ordering;
use std::collections::{BinaryHeap, HashMap};

#[derive(FromRow, Clone, Debug)]
pub struct Node {
    pub id: i32,
    pub x: i32,
    pub y: i32,
}

#[derive(FromRow, Clone, Debug)]
pub struct Edge {
    pub node_a_id: i32,
    pub node_b_id: i32,
    pub weight: i32,
}

// PriorityQueue のエントリを定義
#[derive(Copy, Clone, Eq, PartialEq)]
struct State {
    cost: i32,
    position: i32,
}

// PriorityQueue で最小コストの状態が優先されるように実装
impl Ord for State {
    fn cmp(&self, other: &Self) -> Ordering {
        // 注意: この順序は逆になるべきです (最小の値が最優先)
        other.cost.cmp(&self.cost)
    }
}

// PartialOrd の実装
impl PartialOrd for State {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

pub struct Graph {
    nodes: HashMap<i32, Node>,
    edges: HashMap<i32, Vec<Edge>>,
}

impl Graph {
    pub fn new() -> Self {
        Graph {
            nodes: HashMap::new(),
            edges: HashMap::new(),
        }
    }

    pub fn add_node(&mut self, node: Node) {
        self.nodes.insert(node.id, node);
    }

    pub fn add_edge(&mut self, edge: Edge) {
        self.edges.entry(edge.node_a_id).or_default().push(edge.clone());

        let reverse_edge = Edge {
            node_a_id: edge.node_b_id,
            node_b_id: edge.node_a_id,
            weight: edge.weight,
        };
        self.edges.entry(reverse_edge.node_a_id).or_default().push(reverse_edge);
    }

    pub fn shortest_path(&self, start: i32, goal: i32) -> i32 {
        let mut dist: HashMap<i32, i32> = HashMap::new();
        let mut heap = BinaryHeap::new();

        // 初期化
        dist.insert(start, 0);
        heap.push(State { cost: 0, position: start });

        // メインループ
        while let Some(State { cost, position }) = heap.pop() {
            // 既に見つけた最短経路より長いなら無視
            if cost > *dist.get(&position).unwrap_or(&i32::MAX) {
                continue;
            }

            // 目的地に到達した場合
            if position == goal {
                return cost;
            }

            // 隣接する各ノードに対して
            if let Some(edges) = self.edges.get(&position) {
                for edge in edges {
                    let next = State {
                        cost: cost + edge.weight,
                        position: edge.node_b_id,
                    };

                    // より短い経路が見つかった場合
                    if next.cost < *dist.get(&next.position).unwrap_or(&i32::MAX) {
                        heap.push(next);
                        dist.insert(next.position, next.cost);
                    }
                }
            }
        }

        // 目的地に到達できない場合
        i32::MAX
    }
}
