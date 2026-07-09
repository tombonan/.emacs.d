# Org Tickets Migration - Setup Complete ✅

**Date:** February 2, 2026
**Status:** Enhanced with article-inspired workflow - ready to use!
**Latest Update:** Added NEXT keyword, Daily View, context filtering, and enhanced captures

## What Was Done

### 1. Created New Skill: `/jira-org`

A Claude Code skill to create org-mode files for Jira tickets with improved templates.

**Location:** `~/.claude/skills/jira-org/SKILL.md`

**Usage:**
```bash
/jira-org TICKET-123                  # Creates TICKET-123.org
/jira-org TICKET-123 brief-description # Creates TICKET-123-brief-description.org
``
`
**Examples:**
```bash
/jira-org INT-1234 add-user-auth
/jira-org PLAT-567 fix-memory-leak
```

### 2. Created Org-Mode Configuration

**Location:** `~/.emacs.d/settings/setup-org-tickets.el`

This file is automatically loaded by your init.el and provides:
- Org agenda integration with article-inspired views
- Custom TODO keywords (TODO, NEXT, IN-PROGRESS, WAITING, BLOCKED, REVIEW, DONE)
- Multiple capture templates for quick entry
- Archiving functions
- Auto-update timestamps
- Enhanced tag completion (WORK, PERSONAL, etc.)

### 3. Migrated 65 Existing Tickets

All your existing ticket files were moved from:
- **Before:** `~/Dropbox/org/tickets/*.org`
- **After:** `~/Dropbox/org/tickets/active/*.org`

### 4. Enhanced with Article-Inspired Workflow (February 2026)

**Inspired by:** [My Workflow with Org-Agenda](https://cachestocaches.com/2016/9/my-workflow-org-agenda/)

**New Features Added**:
- **NEXT keyword**: Mark tasks "ready to work on today" (vs TODO = backlog)
- **WAITING keyword**: Distinguish external blockers from internal BLOCKED
- **Daily View (`C-c a d`)**: Schedule + Next Tasks + Active Projects + Week Glance
- **Context filtering**: WORK and PERSONAL tags for focused views
- **Enhanced captures**: Quick next tasks, meeting notes, ideas
- **Work/Personal views**: `C-c a w` and `C-c a p` for context-specific agendas

### 5. Created Directory Structure

```
~/Dropbox/org/tickets/
├── inbox.org                          # Quick captures and notes
├── active/                            # 65 current tickets
│   ├── INT-323-cortex-license-expired.org
│   ├── INT-734-office-365-status-checks.org
│   ├── INT-837-drop-system-logins.org
│   └── ... (62 more tickets)
└── archive/
    ├── 2024/                          # For completed 2024 tickets
    └── 2025/                          # For completed 2025 tickets
```

## Getting Started

### Step 1: Restart Emacs

The configuration is already in place, just restart:
```
M-x restart-emacs
```
Or quit and reopen Emacs.

### Step 2: Try the New Daily View

Press `C-c a d` to see the article-inspired daily agenda view with:
- Today's schedule
- Next tasks (ready to work on)
- Active projects
- Week at a glance
- Remaining tasks

### Step 3: Create a Test Ticket

```
/jira-org TEST-123 migration-test
```

This creates `~/Dropbox/org/tickets/active/TEST-123-migration-test.org`

### Step 4: Open One of Your Migrated Tickets

Use Projectile (still works!):
```
C-c p f
```
Then type a ticket name to open it.

## Daily Workflow

### Article-Inspired Morning Routine (NEW)

Inspired by [cachestocaches.com's org-agenda workflow](https://cachestocaches.com/2016/9/my-workflow-org-agenda/):

1. **Start with the Daily View**: `C-c a d`
   - See today's schedule at the top
   - Review NEXT tasks (ready to work on)
   - Check active projects (IN-PROGRESS)
   - Glance at the week ahead

2. **Pick Your NEXT Tasks**
   - Mark 2-3 TODO items as NEXT for today: `C-c C-t n`
   - These become your focus for the day
   - Tag with `:WORK:` or `:PERSONAL:` for filtering

3. **Start Working**
   - Pick a NEXT task from the agenda
   - Move it to IN-PROGRESS: `C-c C-t i`
   - Do the work

4. **Handle Interruptions**
   - Quick task: `C-c c n` (creates NEXT task for today)
   - Meeting: `C-c c m` (auto-starts clock)
   - Random idea: `C-c c i` (captures for later)

5. **Review Throughout Day**
   - `C-c a w` - See all work items
   - Filter with `/` in agenda, type `WORK` or tag
   - Mark WAITING for tasks blocked by others

6. **End of Day**
   - Archive completed items: `C-c t a`
   - Move unfinished NEXT back to TODO if needed
   - Review what's WAITING or BLOCKED: `C-c a x`

### Creating a New Ticket

```
/jira-org ENG-1234 add-authentication
```

This creates a comprehensive org file with sections for:
- Ticket information with Jira link
- Investigation notes
- Solution design
- Implementation tracking
- Testing plan
- Documentation checklist
- Deployment notes
- Retrospective

### Viewing All Active Work

**Article-Inspired Views** (NEW):
```
C-c a d     # Daily View: Schedule, Next Tasks, Active Projects, Week at a Glance
C-c a w     # Work Focus: All work-tagged items (NEXT, IN-PROGRESS, TODO)
C-c a p     # Personal Focus: All personal-tagged items
```

**Ticket-Specific Views**:
```
C-c a t     # Active Tickets Overview: All ticket states at a glance
C-c a x     # Blocked & Waiting: See items waiting on others
C-c a u     # Urgent items only
```

**Standard Org Views**:
```
C-c a a     # Week agenda view
```

### Working on a Ticket

1. Open the ticket file (Projectile or agenda)
2. Update TODO state: `C-c C-t` (cycles through states)
   - TODO → IN-PROGRESS → REVIEW → DONE
3. Add notes, code snippets, findings
4. Check off items in checklists: `C-c C-c` on checkbox

### Filtering in Agenda View (NEW)

While viewing any agenda (`C-c a d`, `C-c a t`, etc.):

```
/           # Filter by tag (then type WORK, urgent, etc.)
=           # Filter by regex pattern
\           # Filter by complex tag expression
|           # Remove all filters
```

**Examples:**
- Press `/` then type `WORK` - Shows only WORK-tagged items
- Press `/` then type `urgent` - Shows only urgent items
- Press `|` - Clear filters and show everything again

**Filter by TODO state:**
- Press `r` to toggle showing/hiding different TODO states

### Searching for Tickets

```
C-c a s searchterm     # Search all org files
C-c a m urgent         # Find by tag
C-c p f INT-123        # Projectile find (still works!)
```

### Completing a Ticket

1. Mark main heading as DONE: `C-c C-t`
2. Archive the file: `C-c t a`
3. File moves to `archive/2025/`

### Quick Capture (Fast Note Taking)

**Jira Tickets**:
```
C-c c j     # Capture new Jira ticket idea (goes to inbox.org)
```

**Quick Tasks** (NEW):
```
C-c c n     # Next Task - Do Today (scheduled for today, tagged :WORK:)
C-c c q     # Quick note (goes to inbox.org)
```

**Meetings & Ideas** (NEW):
```
C-c c m     # Meeting Notes (auto-starts clock, creates attendee/action sections)
C-c c i     # Idea / Future Task (tagged :IDEA: for later review)
```

Captured items go to `inbox.org` (j, q) or `agenda.org` (n, m, i), then you can refile or create proper ticket files later.

## Key Bindings Reference

### Org Agenda Commands
| Binding     | Action                                      |
|-------------|---------------------------------------------|
| `C-c a d`   | **Daily View** (Article-style)              |
| `C-c a w`   | **Work Focus** (WORK-tagged only)           |
| `C-c a p`   | **Personal Focus** (PERSONAL-tagged only)   |
| `C-c a t`   | Active tickets overview                     |
| `C-c a x`   | Blocked & Waiting review                    |
| `C-c a u`   | Urgent items                                |
| `C-c a a`   | Week agenda view                            |
| `C-c a s`   | Search all org files                        |
| `C-c a m`   | Match tags (e.g., `C-c a m urgent`)         |

### Ticket Management
| Binding     | Action                        |
|-------------|-------------------------------|
| `C-c t a`   | Archive current ticket file   |
| `C-c t u`   | Update timestamp              |
| `C-c C-t`   | Change TODO state             |
| `C-c C-w`   | Refile to archive/project     |

### Org-Mode Essentials
| Binding     | Action                        |
|-------------|-------------------------------|
| `C-c C-c`   | Toggle checkbox               |
| `C-c C-q`   | Add/edit tags                 |
| `C-c /`     | Sparse tree (search in file)  |
| `C-c C-x p` | Set property                  |

### Capture Templates
| Binding     | Action                           |
|-------------|----------------------------------|
| `C-c c j`   | Capture new Jira ticket          |
| `C-c c n`   | **Next Task - Do Today**         |
| `C-c c q`   | Quick note                       |
| `C-c c m`   | **Meeting Notes** (auto-clocks)  |
| `C-c c i`   | **Idea / Future Task**           |

### Still Works (Projectile)
| Binding     | Action                        |
|-------------|-------------------------------|
| `C-c p f`   | Find file in project          |
| `C-c p s g` | Grep in project               |

## TODO States and Their Meaning

| State        | Meaning                         | When to Use                           |
|--------------|---------------------------------|---------------------------------------|
| TODO         | Not started                     | Backlog, not yet ready to start       |
| **NEXT**     | **Ready to work on today**      | **Tasks you've chosen for today**     |
| IN-PROGRESS  | Currently working on it         | Active work in progress               |
| **WAITING**  | **Blocked by external party**   | **Waiting on someone else's action**  |
| BLOCKED      | Blocked by internal issue       | Technical blocker, dependencies       |
| REVIEW       | Code review or PR open          | Awaiting feedback or review           |
| DONE         | Completed                       | Ready to archive                      |
| CANCELLED    | Won't do                        | Deprioritized or obsolete             |

Change state with `C-c C-t` (cycles forward) or `C-u C-c C-t` (backward).

### New Workflow with NEXT
The article-inspired workflow uses **NEXT** to mark tasks ready to work on:
1. Start day with `C-c a d` (Daily View)
2. Look at NEXT tasks - these are ready to tackle
3. Pick one and move to IN-PROGRESS
4. When done, mark DONE and pick another NEXT task
5. Use WAITING for tasks blocked by others (vs BLOCKED for technical issues)

## Using Tags Effectively

Tags help categorize and find tickets quickly.

### Add Tags to a File

At the top of any ticket file:
```org
#+FILETAGS: :backend:security:urgent:
```

### Add Tags to a Heading

Position cursor on heading, press `C-c C-q`, then type tags.

### Suggested Tags

**Context Tags** (NEW - for filtering agenda views):
| Tag            | Use For                          |
|----------------|----------------------------------|
| **`WORK`**     | **Work/job-related tasks**       |
| **`PERSONAL`** | **Personal projects/tasks**      |

**Area Tags**:
| Tag            | Use For                          |
|----------------|----------------------------------|
| `@backend`     | Backend/API work                 |
| `@frontend`    | UI/frontend work                 |
| `@infra`       | Infrastructure/DevOps            |
| `@security`    | Security-related                 |

**Status/Type Tags**:
| Tag            | Use For                          |
|----------------|----------------------------------|
| `urgent`       | High priority/urgent items       |
| `blocked`      | Blocked on external dependency   |
| `research`     | Investigation/research           |
| `bug`          | Bug fixes                        |
| `feature`      | New features                     |
| `refactor`     | Code refactoring                 |
| `documentation`| Documentation updates            |
| **`IDEA`**     | **Future ideas to review**       |
| **`MEETING`**  | **Meeting notes**                |

### Search by Tag

```
C-c a m backend      # Find all backend tickets
C-c a m urgent       # Find urgent items
C-c a m bug+urgent   # Find urgent bugs (AND)
C-c a m bug|feature  # Find bugs or features (OR)
```

## Using Properties for Metadata

Properties store structured data about tickets.

### View/Edit Properties

Position cursor on heading with properties, press `C-c C-x p`, then enter property name.

### Useful Properties

The `/jira-org` skill creates these automatically:
- **TICKET**: Jira ticket ID
- **STATUS**: Current status
- **PRIORITY**: High/Medium/Low
- **POINTS**: Story points estimate
- **SPRINT**: Sprint identifier
- **CREATED**: Creation timestamp
- **UPDATED**: Last update timestamp (auto-updates on save)

### Example Property Drawer

```org
:PROPERTIES:
:TICKET: INT-1234
:STATUS: In Progress
:PRIORITY: High
:POINTS: 5
:SPRINT: 2025-Q1-Sprint-3
:CREATED: [2025-02-02 Sun]
:UPDATED: [2025-02-02 Sun]
:END:
```

## Archiving Workflow

### When to Archive

Archive tickets when:
- Status is DONE
- No further work needed
- Want to keep history but clear from active view

### How to Archive

**Option 1: Archive entire file** (Recommended)
```
1. Open ticket file
2. Press: C-c t a
3. File moves to archive/2025/
```

**Option 2: Refile to archive**
```
1. Position cursor on main heading
2. Press: C-c C-w
3. Select archive location
```

### Finding Archived Tickets

Archived tickets are in `~/Dropbox/org/tickets/archive/YYYY/`

**Search archived tickets:**
```bash
# Using grep
cd ~/Dropbox/org/tickets/archive/
grep -r "search term" .

# Using Projectile (if you add archive to project)
C-c p f   # Find file in project
```

## Tips and Best Practices

### 1. Using the NEXT Keyword Effectively (NEW)

The NEXT keyword is key to the article-inspired workflow:

**What is NEXT?**
- NEXT = "I'm committing to work on this today"
- TODO = "Backlog item, not yet scheduled"

**Daily Routine:**
- Morning: Review TODOs, pick 2-3 to mark as NEXT
- Throughout day: Work on NEXT items, convert to IN-PROGRESS
- Evening: Unfinished NEXT items? Either finish tomorrow or move back to TODO

**Example Flow:**
```
TODO (backlog) → NEXT (chosen for today) → IN-PROGRESS (actively working) → DONE
```

**Tip:** Keep your NEXT list short (3-5 items max). If everything is NEXT, nothing is.

### 2. Use Context Tags for Focus

Tag tasks with `:WORK:` or `:PERSONAL:`:
- `C-c a w` - See only work items
- `C-c a p` - See only personal items
- Helps maintain work/life boundaries
- Quick context switching

**Adding tags:**
- In capture templates: Pre-tagged (e.g., `C-c c n` creates `:WORK:`)
- On existing items: `C-c C-q` then type `WORK` or `PERSONAL`

### 3. WAITING vs BLOCKED

Know when to use each:
- **WAITING**: Blocked by external person/team ("Waiting on design team")
- **BLOCKED**: Internal/technical blocker ("Need to fix tests first")

Review with `C-c a x` to see all items needing follow-up.

### 5. Start Simple

You don't need to use all features at once:
- **Week 1**: Just create tickets and use Projectile (what you do now)
- **Week 2**: Try daily agenda view: `C-c a d`
- **Week 3**: Use NEXT workflow: mark 2-3 tasks daily
- **Week 4**: Try context filtering with WORK/PERSONAL tags
- **Week 5**: Add meeting notes and idea captures

### 6. Keep Active/ Clean

Move completed tickets to archive regularly:
- Makes agenda view cleaner
- Faster searches
- Better organization

### 7. Use Consistent Naming

When creating tickets:
```bash
/jira-org INT-1234 short-kebab-case-description
```

Good: `add-user-auth`, `fix-memory-leak`, `update-docs`
Bad: `my stuff`, `todo`, `URGENT!!!`

### 8. Add Context to Tickets

The template has many sections - use what's helpful:
- **Investigation**: Document findings as you explore
- **Solution Design**: Note alternatives considered
- **Implementation**: Track commits, code changes
- **Testing**: Document test plans
- **Documentation**: Checklist of docs to update

### 9. Review Daily and Weekly

**Daily Review** (NEW):
```
C-c a d     # Daily View: Start your day here
```
- What's scheduled today?
- What NEXT tasks am I committing to?
- What's currently IN-PROGRESS?

**Weekly Review**:
```
C-c a x     # Blocked & Waiting review
```
- What's WAITING or BLOCKED?
- What can be archived?
- What should be NEXT this week?
- Update priorities

### 10. Customize as Needed

The configuration is in `settings/setup-org-tickets.el`. Feel free to:
- Add more TODO states
- Change tag names
- Modify agenda commands
- Adjust key bindings
- Customize capture templates

### 11. Projectile Still Works

You can mix both approaches:
- Use `C-c a t` for overview
- Use `C-c p f` for quick navigation
- They complement each other!

## Troubleshooting

### "Agenda shows no files"

Check: `M-x describe-variable org-agenda-files`

Should include: `~/Dropbox/org/tickets/active/`

**Fix:** Restart Emacs to reload configuration.

### "Can't find ticket I just created"

New tickets are in `active/` directory. Check:
```bash
ls ~/Dropbox/org/tickets/active/ | grep TICKET-ID
```

### "Key binding doesn't work"

Make sure you're in an org-mode file. Check mode line at bottom should show `(Org)`.

Custom bindings like `C-c t a` only work in org-mode buffers.

### "Auto-update timestamp not working"

The timestamp auto-updates on save, but only for files in `tickets/active/`.

Check that your file is in the correct directory.

### "Want to change TODO keyword colors"

Edit `settings/setup-org-tickets.el` and modify:
```elisp
(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "red" :weight bold))
        ("IN-PROGRESS" . (:foreground "yellow" :weight bold))
        ...))
```

## What's Different from Before?

### Before (Projectile-only)
- ✅ Simple flat structure
- ✅ Navigate by filename
- ❌ No overview of active work
- ❌ No status tracking
- ❌ Manual archiving
- ❌ Hard to find urgent/blocked items

### After (Org-mode + Projectile)
- ✅ Organized structure (active/archive)
- ✅ Navigate with Projectile OR agenda
- ✅ **Daily overview with `C-c a d` (article-style)**
- ✅ **NEXT keyword for "ready to work on today"**
- ✅ Track status (TODO → NEXT → IN-PROGRESS → DONE)
- ✅ **WAITING vs BLOCKED distinction**
- ✅ Easy archiving with `C-c t a`
- ✅ **Filter by context (WORK/PERSONAL tags)**
- ✅ Find by tag/status/priority
- ✅ Better templates with checklist tracking
- ✅ Auto-updating timestamps
- ✅ **Enhanced capture templates (meetings, ideas, next tasks)**
- ✅ **Week-at-a-glance view**

## Article-Inspired Workflow Summary

This setup is inspired by Gregory J. Stein's article: [My Workflow with Org-Agenda](https://cachestocaches.com/2016/9/my-workflow-org-agenda/)

### Key Concepts from the Article

**1. The NEXT Keyword**
- Distinguishes "ready to work on" from "someday/maybe"
- Creates a manageable daily task list
- Reduces decision fatigue

**2. The Daily Agenda View**
- Single view to start your day
- Shows schedule + actionable tasks + projects + week ahead
- Everything you need in one place

**3. Context Filtering**
- Use tags (WORK/PERSONAL) to filter views
- Press `/` in agenda to filter by tag
- Quickly switch contexts

**4. Capture Templates**
- Minimize interruption to current work
- Quick capture during meetings or for ideas
- Process later into proper tickets

**5. Review Regularly**
- Daily: Pick NEXT tasks
- Weekly: Review BLOCKED/WAITING items
- Keep system current and useful

### How This Adapts the Article for Jira Workflows

The article's workflow + your Jira ticket tracking:

| Article Feature        | Your Implementation                    |
|------------------------|----------------------------------------|
| NEXT tasks             | `C-c a d` shows NEXT section           |
| Daily agenda           | `C-c a d` - Daily View                 |
| Context tags           | WORK/PERSONAL tags + filtered views    |
| Meeting notes          | `C-c c m` with auto-clock              |
| Project tracking       | Jira ticket files in active/           |
| Capture templates      | 5 templates: tickets, tasks, ideas     |
| Weekly review          | `C-c a x` for blocked/waiting review   |

## Additional Resources

### Files Created/Updated
- `~/.claude/skills/jira-org/SKILL.md` - The /jira-org skill
- `~/.emacs.d/settings/setup-org-tickets.el` - Org configuration (updated Feb 2026 with article-inspired features)
- `~/.emacs.d/ORG-TICKETS-MIGRATION.md` - Detailed migration guide
- `~/.emacs.d/example-org-structure.md` - Structure examples
- `~/.emacs.d/ORG-TICKETS-SETUP-COMPLETE.md` - This file! (updated Feb 2026)

### Learning More
- Org-mode manual: `C-h i d m Org RET`
- Org agenda: `C-h i d m Org RET` then search for "agenda"
- Your config: `~/.emacs.d/settings/setup-org-tickets.el`

### Customization
Want to customize? Edit these files:
- **Skill template**: `~/.claude/skills/jira-org/SKILL.md`
- **Org config**: `~/.emacs.d/settings/setup-org-tickets.el`
- **Agenda commands**: In setup-org-tickets.el, find `org-agenda-custom-commands`
- **TODO keywords**: In setup-org-tickets.el, find `org-todo-keywords`
- **Tags**: In setup-org-tickets.el, find `org-tag-alist`

## Quick Start Checklist

**Basic Setup**:
- [ ] Restart Emacs
- [ ] Try new daily view: `C-c a d`
- [ ] Create test ticket: `/jira-org TEST-123 test`

**Try NEXT Workflow** (NEW):
- [ ] Open a ticket: `C-c p f`
- [ ] Mark it NEXT: `C-c C-t n`
- [ ] View in daily agenda: `C-c a d` (should appear in NEXT section)
- [ ] Move to IN-PROGRESS: `C-c C-t i`
- [ ] Complete it: `C-c C-t d`

**Try New Captures**:
- [ ] Quick task for today: `C-c c n`
- [ ] Capture an idea: `C-c c i`
- [ ] Try meeting template: `C-c c m`

**Explore Views**:
- [ ] Work focus view: `C-c a w`
- [ ] Blocked & waiting: `C-c a x`
- [ ] Filter by tag in agenda: Press `/` then type `WORK`

**Cleanup**:
- [ ] Archive test items: `C-c t a`

## Questions?

- Configuration file: `~/.emacs.d/settings/setup-org-tickets.el`
- Detailed guide: `~/.emacs.d/ORG-TICKETS-MIGRATION.md`
- Skill definition: `~/.claude/skills/jira-org/SKILL.md`

Happy ticket tracking! 🎫
