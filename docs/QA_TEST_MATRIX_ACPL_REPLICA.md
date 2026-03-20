# QA Test Matrix - ACPL Replica

## Scope
Static frontend replica validation for all public pages.

## Environment
- OS: Windows
- Browser set: Chromium-based + Firefox recommended
- Viewports: 360x800, 768x1024, 1280x800

## Test Cases

1. NAV-001
- Verify header links route correctly on all pages.
- Expected: Home, About, Team, Courses, Careers reachable.

2. FTR-001
- Verify footer links route to all policy pages.
- Expected: Privacy, Terms, Refund, Delivery pages reachable.

3. HOM-001
- Verify homepage sections render: Hero, Training, Testimonials, Careers CTA.
- Expected: All sections visible and readable.

4. CRS-001
- Verify courses page contains six course cards.
- Expected: Leading SAFe, Scrum Master, Advanced Scrum Master, DevOps, POPM, LPM.

5. CAR-001
- Verify careers CTA to jobs and email.
- Expected: Jobs page opens, mailto action present.

6. JOB-001
- Verify jobs cards include role summary and location.
- Expected: All listed jobs readable.

7. POL-001
- Verify policy pages load and display legal placeholder text.
- Expected: Privacy, Terms, Refund, Delivery each has title + body content.

8. UI-001
- Verify color palette matches approved rebrand tokens.
- Expected: #0B3C5D, #1D7A8C, #BFDB38 visible in global UI.

9. RWD-001
- Verify no layout overlap at mobile viewport.
- Expected: Single-column stack on narrow screens.

10. ACC-001
- Verify text remains readable with sufficient contrast.
- Expected: No unreadable text blocks.

## Exit Criteria
- 0 critical defects
- 0 high-severity navigation defects
- No missing required pages
