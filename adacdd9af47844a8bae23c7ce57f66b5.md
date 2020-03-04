alloc_pages

`alloc_pages` is the main API of physical pages allocator. We all know that this allocator named buddy allocator. The "heart" function of buddy allocator is `__alloc_pages_nodemask`. There is a struct named `struct alloc_context` contains the parameters of the pages' requestion which will be pass to the deep calling function. The parameters are:
```c
struct alloc_context {
	struct zonelist *zonelist;
	nodemask_t *nodemask;
	struct zoneref *preferred_zoneref;
	int migratetype;
	enum zone_type high_zoneidx;
	bool spread_dirty_pages;
};
```

Let's see the arguments of `alloc_pages`, the first one is gfp_mask, which means "Get Free Pages flag". This argument descriped the features of the requested pages. The gfp_t bits defined in `linux/include/gfp.h`. As the other argument is the size of pages requested.

`should_fail_alloc_page` can provide the page allocate failed injection.

After the sanity check & flags deteminated. Here comes the first allocation `get_page_from_freelist`, try to get pages from the free list of zone. Scan the zonelist to find the proper one with enough free pages. Than call `rmqueue` to get pages and after `prep_new_page`, return the pages to finish allocation.

CMA（Contiguous Memory Allocator）

`/proc/pagetypeinfo` to see the physical pages type.

**The node order to be selected?**
**What is migration order of pages type?**
**Watermark boost?**

The name meaning of buddy allocator comes from the `free_pages`. The subtle of buddy is the function `__find_buddy_pfn`:
```c
static inline unsigned long
__find_buddy_pfn(unsigned long page_pfn, unsigned int order)
{
	return page_pfn ^ (1 << order);
}
```
This buddy finding implementation is really beautiful.








id: adacdd9af47844a8bae23c7ce57f66b5
parent_id: cd72a843f7b74732a4f4ba56fdc7ac7f
created_time: 2020-02-25T06:53:40.932Z
updated_time: 2020-02-25T14:51:55.904Z
is_conflict: 0
latitude: 22.53330000
longitude: 114.13330000
altitude: 0.0000
author: 
source_url: 
is_todo: 0
todo_due: 0
todo_completed: 0
source: joplin-desktop
source_application: net.cozic.joplin-desktop
application_data: 
order: 0
user_created_time: 2020-02-25T06:53:40.932Z
user_updated_time: 2020-02-25T14:51:55.904Z
encryption_cipher_text: 
encryption_applied: 0
markup_language: 1
is_shared: 0
type_: 1