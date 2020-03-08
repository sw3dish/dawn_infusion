- Should Lyra be integrated into the CMS for stories/newsletters?
  - When a story is updated, it gets updated in Lyra?
  - Or a separate upload


- Improvements
  - Ensure that newsletters in Lyra are made of the same HTML that is in Lyra for all stories
  - If Lyra acts like I think it does (acts like a central repository?)
    - I tightly coupled Lyra to the individual stories
      - Would break out Lyra interaction separately from the individual stories
    - Allow for writers to fetch from Lyra, then diff the changes
  - Get webpacker to properly pack CSS (couldn't figure it out)
  - Better story selection
    - Searching for stories based on various metadata
      - tags
      - searching body html
    - Ordering
    - Might do it with React DnD
  - Generate a teaser from body html to display in the CMS