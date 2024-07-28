# 结合 [live_svelte](https://github.com/woutdp/live_svelte) & [shadcn-svelte](https://shadcn-svelte.com/)

- `mix phx.new tls --verbose --no-install --database postgres --adapter bandit --no-install --no-gettext --no-ecto --no-mailer`
- 根据 [live_svelte](https://hexdocs.pm/live_svelte/readme.html#installation) 教程 安装
- 修改 mix.exs
- 新增依赖`{:live_svelte, "~> 0.13"}`
- 编辑 aliases
```elixir
defp aliases do  
  [  
    setup: ["deps.get", "assets.setup", "assets.build"],  
    "assets.setup": ["tailwind.install --if-missing", "cmd --cd assets npm install"],  
    "assets.build": ["tailwind tls", "cmd --cd assets node build.js"],  
    "assets.deploy": [  
      "tailwind tls --minify",  
      "cmd --cd assets node build.js --deploy",  
      "phx.digest"  
    ]  
  ]  
end
```
- 删除 esbuild 相关依赖和配置
- 运行 `mix live_svelte.setup`
- 将 `import LiveSvelte` 增加到文件 `/lib/<app_name>_web.ex` 的 `html_helpers/0` 中
- For tailwind support, add `"./svelte/**/*.svelte"` to `content` in the `tailwind.config.js` file
- 运行 `mix setup`
- 完成 live_svelte 安装
- 然后开始安装 [shadcn-svelte](https://www.shadcn-svelte.com/docs/installation/manual)
- `cd assets && npm install tailwind-variants clsx tailwind-merge lucide-svelte`
- `npm install -D typescript`
- copy `svelte/utils.ts`
- init `components.json` by `npx shadcn-svelte@latest init`
- edit `tailwind.config.js`
- edit `css/app.css`
- 增加组件 `npx shadcn-svelte@latest add button`