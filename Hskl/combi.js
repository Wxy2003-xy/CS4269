const ops = [
    { name: "A", fn: x => x / 2.0 },
    { name: "B", fn: x => x - 900 },
    { name: "C", fn: x => x + 2000 },
    { name: "D", fn: x => x * 5 },
    { name: "E", fn: x => x + 500 },
  ];
  
  const TARGET = 3000;
  const MAX_DEPTH = 6;
  
  function dfs(x, path, depth) {
    let res = [];
  
    if (depth > MAX_DEPTH) return res;
  
    if (x === TARGET) {
      res.push(path);
      return res;
    }
  
    if (x < -10000 || x > 10000) return res;
  
    for (const op of ops) {
      const sub = dfs(op.fn(x), [...path, op.name], depth + 1);
      res = res.concat(sub);
    }
  
    return res;
  }

  const results = dfs(0, [], 0);

  results.sort((a, b) => {
    if (a.length !== b.length) return a.length - b.length;
  
    const sa = a.join("");
    const sb = b.join("");
    return sa.localeCompare(sb);
  });

  for (const r of results) {
    console.log(r.join(""));
  }