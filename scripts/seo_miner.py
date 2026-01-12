# /// script
# requires-python = ">=3.11"
# dependencies = [
#     "requests",
# ]
# ///

import requests
import time
import csv
import string
import random

def get_google_suggestions(query, lang='en', country='us'):
    """
    获取 Google 搜索下拉框的联想词
    """
    url = "http://suggestqueries.google.com/complete/search"
    params = {
        'client': 'chrome',  # 模拟 Chrome 浏览器行为
        'q': query,
        'hl': lang,     # 语言: 英语 (针对全球市场)
        'gl': country,  # 地区: 美国 (主要付费市场)
    }
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
    }
    
    try:
        response = requests.get(url, params=params, headers=headers, timeout=5)
        if response.status_code == 200:
            results = response.json()
            # Google 返回格式通常为: [query, [suggestions...], ...]
            if results and len(results) > 1:
                return results[1]
    except Exception as e:
        print(f"⚠️ 请求失败 '{query}': {e}")
    
    return []

def mine_keywords():
    print("🚀 开始挖掘 Punkscosmos 的长尾关键词...")
    
    # 1. 定义核心种子词 (Seed Keywords)
    # 这些词决定了我们要去哪些领域截流
    seeds = [
        "ai image generator for",    # 场景挖掘 (e.g., for tattoo, for youtube)
        "ai art style",              # 风格挖掘 (e.g., cyberpunk, anime)
        "turn photo into",           # 图生图功能 (e.g., into cartoon, into sketch)
        "ai generator like",         # 竞品截流 (e.g., like midjourney)
        "generate ai image of",      # 具体事物 (e.g., of futuristic city)
    ]

    # 2. 字母表遍历 (Alphabet Soup Strategy)
    # 模拟用户输入 "ai image generator for a...", "for b..."
    modifiers = list(string.ascii_lowercase) # a-z
    
    all_keywords = set()

    for seed in seeds:
        print(f"\n🔍 正在深挖种子词: [{seed}]")
        
        # 第一层：直接搜索种子词
        base_suggestions = get_google_suggestions(seed)
        for s in base_suggestions:
            all_keywords.add(s)
        
        # 第二层：加上 a-z 后缀遍历
        for char in modifiers:
            query = f"{seed} {char}"
            suggestions = get_google_suggestions(query)
            
            if suggestions:
                # 打印进度，让你看到挖到了什么好东西
                print(f"   ->前缀 '{char}': 发现 {len(suggestions)} 个词 (如: {suggestions[0]})")
                for s in suggestions:
                    all_keywords.add(s)
            
            # 礼貌性延时，随机 0.2-0.5秒，防止被 Google 暂时屏蔽
            time.sleep(random.uniform(0.2, 0.5))

    # 3. 数据清洗与保存
    filename = "punkscosmos_seo_keywords.csv"
    sorted_keywords = sorted(list(all_keywords))
    
    print(f"\n💾 正在保存数据...")
    with open(filename, 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(["Keyword", "Word Count"]) # 表头
        for kw in sorted_keywords:
            writer.writerow([kw, len(kw.split())])

    print(f"\n✅ 任务完成！")
    print(f"📊 共挖掘到 {len(all_keywords)} 个高价值长尾词。")
    print(f"📂 文件已保存为: {filename}")
    print("👉 下一步建议：打开 CSV，挑选出与你产品功能最匹配的 20-50 个词作为第一批 pSEO 页面目标。")

if __name__ == "__main__":
    mine_keywords()