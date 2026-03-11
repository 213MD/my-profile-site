# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Bucket List** is a lightweight, framework-free web application for managing personal goals and life aspirations. It uses Vanilla JavaScript with LocalStorage for data persistence.

- **Type**: Single-page HTML/CSS/JS application
- **No build process required** - Open `index.html` directly in a browser
- **No external dependencies** - Uses Tailwind CSS via CDN
- **Target audience**: Individual learners, portfolio projects

## Development Commands

Since this is a static HTML/CSS/JS app with no build system, development is straightforward:

### Running the Application

```bash
# Method 1: Direct file open (simplest)
open index.html

# Method 2: Python HTTP Server
python -m http.server 8000
# Then navigate to http://localhost:8000

# Method 3: VS Code Live Server
# Right-click index.html → "Open with Live Server"
```

### Manual Testing Approach

Since there's no test framework, testing is manual and browser-based:
- Open the app in a browser
- Test CRUD operations (add, edit, delete bucket items)
- Test state transitions (mark complete/incomplete)
- Test filtering (all, active, completed)
- Verify LocalStorage persistence (refresh page, data should persist)
- Test responsive design (resize browser, check mobile/tablet/desktop layouts)

### Code Quality Checks (Optional)

If you want to set up linting, the project is compatible with:
- **ESLint** for JavaScript: `npx eslint js/**/*.js`
- **Prettier** for formatting: `npx prettier --write .`

However, no linter is currently configured.

## Architecture Overview

### Design Pattern: Separation of Concerns

The application uses a simple two-module architecture:

```
┌─────────────────────────────────────────────────────┐
│                   index.html                         │
│            (Static UI structure, no logic)           │
└──────────────────────┬──────────────────────────────┘
                       │
          ┌────────────┴────────────┐
          │                         │
    ┌─────▼─────┐          ┌─────────▼──────┐
    │ storage.js│          │    app.js      │
    │ (Model)   │◄────────►│ (Controller)   │
    └───────────┘          └────────────────┘
          │
    ┌─────▼──────────┐
    │  LocalStorage  │
    └────────────────┘
```

### Module Breakdown

**`js/storage.js`** - Data Persistence Layer
- Pure data management with no UI dependencies
- Methods: `load()`, `save()`, `addItem()`, `updateItem()`, `deleteItem()`, `toggleComplete()`, `getStats()`, `getFilteredList()`
- Handles JSON serialization to/from LocalStorage
- **Key concept**: Always load fresh data for each operation (no in-memory cache)

**`js/app.js`** - Application Logic & UI Controller
- `BucketListApp` class: manages state, events, and rendering
- Methods: `cacheElements()`, `bindEvents()`, `render()`, `handleAdd()`, `handleFilter()`, `handleToggle()`, `handleEditSubmit()`, `handleDelete()`
- **Key concept**: Single-page rendering - `render()` method updates entire list based on current filter
- Handles user interactions and delegates data operations to `BucketStorage`

**`css/styles.css`** - Tailwind Supplements
- Extends Tailwind CSS (CDN-loaded) with custom animations and media queries
- Animations: slideIn (items), fadeIn (modals), scaleIn (modal content)
- Dark mode support via `prefers-color-scheme` media query

### Data Model

```javascript
{
  id: "1730880000000",           // Timestamp-based unique identifier
  title: "Learn a new language",  // Goal title (user input)
  completed: false,               // Boolean state
  createdAt: "2025-11-06T...",   // ISO timestamp
  completedAt: null               // ISO timestamp (null until completed)
}
```

### Key Design Decisions

1. **No frontend framework**: Vanilla JS for simplicity and learning value
2. **Object-oriented**: Uses ES6 classes (BucketListApp) for organization
3. **Functional module**: `BucketStorage` is a plain object with methods (not a class)
4. **Event delegation**: Events bound in `cacheElements()` during init
5. **XSS prevention**: `escapeHtml()` method sanitizes user input
6. **LocalStorage only**: No server, no sync - each browser has isolated data

## How Data Flows Through the App

1. User types and clicks "추가" button
2. `handleAdd()` validates and calls `BucketStorage.addItem()`
3. Storage saves to LocalStorage and returns new item
4. `render()` calls `BucketStorage.getFilteredList()` to fetch data
5. `createBucketItemHTML()` builds HTML for each item
6. DOM updates with new list

## Extending the Application

### Adding a New Feature

1. **Update data model** (if needed): Modify item structure in `storage.js`
2. **Add storage method**: Add new method to `BucketStorage` object
3. **Add UI handler**: Add method to `BucketListApp` class
4. **Bind event**: Add event listener in `bindEvents()`
5. **Update render**: Modify `createBucketItemHTML()` or `render()` as needed
6. **Test manually**: Use browser dev tools and test in different screen sizes

### Example: Adding Priority Levels

```javascript
// storage.js - extend data model
const newItem = {
  id: Date.now().toString(),
  title: title.trim(),
  completed: false,
  priority: 'medium', // Add this
  createdAt: new Date().toISOString(),
  completedAt: null
};

// app.js - update HTML to show priority
// app.js - add filter handler for priority
```

## Important Code Patterns

### LocalStorage Error Handling
```javascript
// Always use try-catch in storage.js
try {
    const data = localStorage.getItem(this.STORAGE_KEY);
    return data ? JSON.parse(data) : [];
} catch (error) {
    console.error('데이터 로드 실패:', error);
    return [];
}
```

### DOM Element Caching
All DOM queries happen once in `cacheElements()` during init - don't query repeatedly in loops.

### Inline Event Handlers
Current implementation uses inline `onclick` in HTML strings. This is acceptable for a small app but becomes unmaintainable at scale. Consider delegated event listeners if expanding significantly.

## Browser Compatibility

- Modern browsers (Chrome, Firefox, Safari, Edge)
- Requires LocalStorage API support
- CSS animations use standard properties (no vendor prefixes needed for modern browsers)

## Future Considerations

The README lists potential improvements:
- Categories/tags
- Image attachments
- Detailed notes
- Target dates
- Priority levels
- Data import/export
- Dark mode toggle (partially implemented in CSS)
- Drag-and-drop sorting

Before implementing these, consider:
- Will the data model need migration? (Plan backward compatibility)
- Should UI be reorganized for more complex features?
- Does filtering logic need refactoring if adding multiple filter dimensions?

## Debugging Tips

**LocalStorage inspection**:
```javascript
// In browser console
localStorage.getItem('bucketList')  // View raw JSON
JSON.parse(localStorage.getItem('bucketList'))  // Formatted view
localStorage.clear()  // Reset all data
```

**DOM state**:
- Open browser DevTools (F12)
- Inspect elements to check classes (especially `.active` on filter buttons)
- Check that hidden elements have `hidden` class

**Common issues**:
- Items not showing: Check `this.currentFilter` value
- Data not persisting: Verify LocalStorage quota isn't exceeded
- Styles not applying: Verify Tailwind CDN is loading (check Network tab)
