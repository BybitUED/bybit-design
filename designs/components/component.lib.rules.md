# component.lib.pen — Design Rules

> Companion spec for the Pencil component library.
> Components marked "instance" are reusable nodes in the .pen file.
> Components marked "spec" are simple enough to generate inline from rules.

---

## Color Variables (Dark Mode)

| Token | Hex | Usage |
|-------|-----|-------|
| `$T1` | #FFFFFF | Primary text, icon |
| `$T2` | #6A6E73 | Secondary text |
| `$T3` | #494C4F | Tertiary text, placeholder |
| `$T4` | #383B3D | Disabled text, border |
| `$Text_Gray` | #999C9E | Gray text |
| `$Bg_Page` | #000000 | Page background |
| `$Bg_Card` | #141414 | Card background |
| `$Bg_Float` | #0D0D0D | Float/panel background |
| `$Ele_line` | #1E1F24 | Divider line |
| `$Ele_border` | #404347 | Border line (stronger) |
| `$Ele_hover` | #25262B | Hover state |
| `$Brand` | #FF9C2E | Brand orange |
| `$Brand_bg` | #FF9C2E14 | Brand background |
| `$Brand_hover` | #E68A1E | Brand hover |
| `$Brand_text` | #F29229 | Brand text |
| `$Green` | #06C167 | Buy / positive |
| `$Green_bg` | #06C16714 | Green background |
| `$Red` | #E84064 | Sell / negative |
| `$Red_bg` | #E8406414 | Red background |
| `$Blue` | #3B82F6 | Info |
| `$Yellow` | #F0B90B | Warning |
| `$Yellow_bg` | #F0B90B14 | Warning background |
| `$static_Black` | #121214 | Static black (button text on brand) |
| `$static_White` | #FFFFFF | Static white |

## Typography Variables

| Token | Value | Matching textStyle |
|-------|-------|--------------------|
| `$fs_8` / `$lh_8` | 8 / 10 | Semibold/8 |
| `$fs_10` / `$lh_10` | 10 / 14 | */10 |
| `$fs_12` / `$lh_12` | 12 / 18 | */12 |
| `$fs_14` / `$lh_14` | 14 / 22 | */14 |
| `$fs_16` / `$lh_16` | 16 / 24 | */16 |
| `$fs_18` / `$lh_18` | 18 / 26 | */18 |
| `$fs_20` / `$lh_20` | 20 / 28 | */20 |
| `$fs_24` / `$lh_24` | 24 / 32 | */24 |
| `$fw_regular` | 400 | Regular weight |
| `$fw_semibold` | 600 | Semibold weight |
| `$font_family` | Inter | Default font |

---

## StatusBar [instance]

| Name | ID | Size | Description |
|------|----|------|-------------|
| StatusBar | `OUoAC` | 393 x 59 | iOS status bar (iPhone 14). Time "9:41" + cellular + wifi + battery. |

Usage: First child of every page root, `layoutAlign: "STRETCH"`.

---

## Navigation Bar [instance]

Artboard: `ZzO5y` ("Navigation")

44px height, 393px width. Use below StatusBar. All `reusable: true`.
Title text child name: `"Text"` (override via content). Action text child name: `"action"`.

| Name | ID | Left | Right | Override keys |
|------|----|------|-------|---------------|
| Nav_Arrow_Text | `bB4ue` | ← arrow | "Action" ($Brand) | Text, action |
| Nav_Arrow_Icons | `MbzBI` | ← arrow | refresh + more | Text |
| Nav_Cancel_Text | `wiuqh` | "Cancel" ($T1) | "Confirm" ($Brand) | 取消, Text, action |
| Nav_Cancel_Icons | `ohyfj` | "Cancel" ($T1) | refresh + more | 取消, Text |
| Nav_Close_Text | `yWiCj` | × close | "Action" ($Brand) | Text, action |
| Nav_Close_Icons | `IFrfH` | × close | refresh + more | Text |

Icons used: `icon_direction left`, `icon_close`, `icon_refresh`, `icon_more horizontal` — all fill `$T1`.
Title: 18px/600 `$T1`. Action text: 14px/400 `$Brand`. Cancel text: 14px/400 `$T1`.

---

## Buttons [instance]

Artboard: `xxtk9` ("Buttons")

All variants: Dark Mode, Normal state, `reusable: true`.
Each button has hidden `icon1` / `icon2` slots (enable to show icons).
Override text via `"Button Text"` child name.

### Button_Primary (fill: `$Brand`, text: `$static_Black`)

| Name | ID | Size | cornerRadius | padding | fontSize |
|------|----|------|-------------|---------|----------|
| Primary_XL | `PYnzZ` | 48px | 24 | [12,28] | 16/600 |
| Primary_L | `qCerK` | 40px | 20 | [9,20] | 14/600 |
| Primary_M | `DyBp0` | 36px | 18 | [7,20] | 14/600 |
| Primary_S | `JsEu1` | 28px | 14 | [5,16] | 12/600 |

### Button_Secondary (stroke: `$T4` 1px, no fill, text: `$T1`)

| Name | ID | Size | cornerRadius | padding | fontSize |
|------|----|------|-------------|---------|----------|
| Secondary_XL | `uj87l` | 48px | 24 | [12,28] | 16/600 |
| Secondary_L | `E5Iuw` | 40px | 20 | [9,20] | 14/600 |
| Secondary_M | `uC6AZ` | 36px | 18 | [7,20] | 14/600 |
| Secondary_S | `N4Q6s` | 28px | 14 | [5,16] | 12/600 |
| Secondary_XS | `sB42T` | 24px | 14 | [5,6] | 10/400 |

### Button_Trading_Buy (fill: `$Green`, text: `$static_White`)

| Name | ID | Size | cornerRadius | padding | fontSize |
|------|----|------|-------------|---------|----------|
| Trading_Buy_XL | `5VtXW` | 48px | 24 | [12,28] | 16/600 |
| Trading_Buy_L | `7E2jb` | 40px | 20 | [9,20] | 14/600 |
| Trading_Buy_M | `FnQOG` | 36px | 18 | [7,20] | 14/600 |
| Trading_Buy_S | `3cX70` | 28px | 14 | [5,16] | 12/600 |

### Button_Trading_Sell (fill: `$Red`, text: `$static_White`)

| Name | ID | Size | cornerRadius | padding | fontSize |
|------|----|------|-------------|---------|----------|
| Trading_Sell_XL | `hGD6f` | 48px | 24 | [12,28] | 16/600 |
| Trading_Sell_L | `RGdG1` | 40px | 20 | [9,20] | 14/600 |
| Trading_Sell_M | `1sFw4` | 36px | 18 | [7,20] | 14/600 |
| Trading_Sell_S | `jqU22` | 28px | 14 | [5,16] | 12/600 |

### Button_Text (no fill, no stroke, text: `$T1`)

| Name | ID | fontSize |
|------|----|----------|
| Text_L | `qhBYb` | 16/600 |
| Text_M | `2AGrh` | 14/600 |
| Text_S | `QVkqu` | 12/400 |

### Button_Group (bottom bar with Home Bar)

| Name | ID | Description |
|------|----|-------------|
| Group_1btn | `zbkBJ` | Single primary button |
| Group_2btn | `TlVSk` | Primary + Secondary vertical |
| Group_3btn | `ymZx7` | 3 buttons vertical |
| Group_Text | `EjMtu` | Button + text link |
| Group_Icon | `JxuXW` | Button + icon |
| Group_2Icon | `NHx6D` | Button + 2 icons |
| Group_2H | `MHpjj` | 2 buttons horizontal |

### Disable State

Not stored as separate components. Apply `opacity: 0.4` to any Normal variant.

---

## Divider [spec]

Too simple for component instances. Generate inline:

### Horizontal (most common)

```
{type:"line", width:"fill_container", height:0, stroke:{align:"center", fill:"$Ele_line", thickness:0.5}}
```

### Variants

| Type | Color | Thickness | Usage |
|------|-------|-----------|-------|
| Line 0.5 | `$Ele_line` (#1E1F24) | 0.5 | Default divider (99% use) |
| Line 1 | `$Ele_line` | 1 | Section divider |
| Border 0.5 | `$Ele_border` (#404347) | 0.5 | Stronger separator |
| Border 1 | `$Ele_border` | 1 | Strong section break |

### Vertical

```
{type:"path", width:0, height:40, stroke:{align:"center", fill:"$Ele_line", thickness:0.5}}
```

---

## Icon Libraries [instance]

### SingleColor Icons 2025

Artboard: `Mr2L7` — 522 icons, 24px, fill bound to `$T1`.
35 rows x 15 per row. All `reusable: true`.

### Token Icons

Artboard: `GeqM5` — 36 token logos, 48px.
3 rows x 12 per row. All `reusable: true`.

### Other Icon Artboards (at x=0)

| Artboard | ID | Content |
|----------|----|---------|
| Icons/Result State | `0wZ0S` | Success/Error/Warning/Clock states |
| Icons/Pay | `qVERq` | Payment icons |
| Icons/Social Media | `ZDbM3` | Social platform logos |
| Icons/Business Line | `4mWwa` | BL_ business icons |
| Icons/Payment Method | `xri5i` | Payment method logos |
| Icons/Fiat Currency | `u60od` | Fiat currency icons |
| Icons/Flags | `gp7Sl` | Country flags |

---

## Tabbar [instance]

Artboard: `KTa8j` ("Tabbar")

87px height, 393px width. Bottom navigation bar with 5 tabs + iOS Home Bar.
Component ID: `0DsPv`, `reusable: true`.

### Structure

| Layer | ID | Description |
|-------|----|-------------|
| Background rect | `yaOoA` | fill `$Bg_Page`, 393×55 |
| .iOS_Home Bar | `lzIqy` | `reusable: true`, white indicator bar (`$static_White`) |
| Tabbar glass | `XidN6` | 381×64, cornerRadius 36, background blur, top border 0.4px |

### Tab Items

Each tab has an icon (path) and a text label. Active tab: `$T1` (white). Inactive tabs: `$T2` (gray).

| Tab | Text ID | Icon Path ID(s) | Default State |
|-----|---------|-----------------|---------------|
| Home | `jJJcg` | `27RD9` (active, $T1), `rHxFr` (inactive, $T2, hidden) | **Active** |
| Markets | `k5kah` | `Ypc2B` ($T2) | Inactive |
| Trade | `sZUXY` | `mJrYd` ($T2) | Inactive |
| Earn | `lyq5e` | `YgXAv` ($T2) | Inactive |
| Assets | `MnioN` | `3KeBg` ($T2) | Inactive |

### Switching Active Tab

To change active tab: set desired tab's icon fill + text fill to `$T1`, set all others to `$T2`.
For Home tab: toggle `rOH73` (enabled:false) and `TdIjG` (enabled:true) to swap between inactive/active icon variants.

---

## Tabs [instance]

Artboard: `2SC43` ("Tabs")

### Tab_Average_Icon (2-segment icon toggle)

32px height, cornerRadius 999 (pill). Background `#1E1F24`. Active segment: `#404854`.
Icons are inline paths (chart icon + trade icon). All `reusable: true`.

| Name | ID | Selected |
|------|----|----------|
| Tab_Average_Icon_Order | `IWEs2` | Trade (right) |
| Tab_Average_Icon_Chart | `XuAWI` | Chart (left) |

### Tab_BuySell (Buy/Sell text toggle)

36px height, 280px width, cornerRadius 999 (pill). 2-segment text toggle ("Trade" / "Trade").
Active segment has `#2B2E31` background with colored text. Inactive segment: `#1E1F24` background.
All `reusable: true`.

| Name | ID | Active Color | Use for |
|------|----|-------------|---------|
| Tab_BuySell_Gray | `mbb9z` | `$T1` (white) | Default/neutral |
| Tab_BuySell_Red | `bm0Oe` | `$Red` | Sell selected |
| Tab_BuySell_Red_Light | `VneFF` | `$Red` (10% bg) | Sell selected (subtle) |
| Tab_BuySell_Green | `52kb7` | `$Green` | Buy selected |
| Tab_BuySell_Green_Light | `LiXnC` | `$Green` (10% bg) | Buy selected (subtle) |
| Tab_BuySell_Yellow | `VNqPB` | `$Yellow` | Warning |
| Tab_BuySell_Yellow_Light | `LFq00` | `$Yellow` (10% bg) | Warning (subtle) |

### Tab_Pill / Tab_Underline / Tab_Text [spec]

Too complex with variable item counts for fixed instances. Generate inline.

#### Size Variants

| Size | Container Height | fontSize | fontWeight (active/inactive) | lineHeight | gap |
|------|-----------------|----------|------------------------------|------------|-----|
| L | 36 | 16 | 600 / 400 | 24 | 20 |
| M | 30 | 14 | 600 / 400 | 22 | 16 |
| S | 26 | 12 | 600 / 400 | 18 | 16 |

#### Common Container

```
{type:"frame", layoutMode:"HORIZONTAL", itemSpacing:<gap>, paddingLeft:20, height:<containerHeight>, counterAxisAlignItems:"CENTER"}
```

#### Tab Item (text node)

- **Active**: `fill:"$T1"`, `fontWeight:600`
- **Inactive**: `fill:"$T2"`, `fontWeight:400`

#### Style Differences

| Style | Decoration |
|-------|-----------|
| **Pill (L1)** | No container decoration. Active item visually distinct by text weight only. |
| **Underline (L2)** | Container has bottom border: `stroke:{align:"inside", fill:"$Ele_line", thickness:{bottom:0.5}}`. Active item has a 2px `$T1` underline below (add a `line` child or nested frame with bottom border). |
| **Text (L3)** | No container decoration. Purely text weight difference between active/inactive. |

#### Example: 3-Tab Underline (L size)

```
{type:"frame", layout:"vertical", width:"fill_container", gap:0,
  stroke:{align:"inside", fill:"$Ele_line", thickness:{bottom:0.5}},
  children:[
    {type:"frame", layout:"horizontal", gap:20, paddingLeft:20, height:36,
      alignItems:"center",
      children:[
        {type:"text", content:"Spot", fill:"$T1", fontSize:16, fontWeight:600, lineHeight:24},
        {type:"text", content:"Futures", fill:"$T2", fontSize:16, fontWeight:400, lineHeight:24},
        {type:"text", content:"Options", fill:"$T2", fontSize:16, fontWeight:400, lineHeight:24}
      ]}
  ]}
```

---

## Guided Tour [spec]

Tooltip bubble with arrow pointer. Generate inline — too many positional variants for instances.

### Structure

```
VERTICAL frame (width: auto)
  ├── .Arrow-up (if arrow on top)
  ├── Card (fill: $Bg_Card, cornerRadius: 8, padding: [12,16], gap: 12)
  │     ├── .Content (VERTICAL, gap: 2)
  │     │     ├── Title row (HORIZONTAL, gap: 4)
  │     │     │     ├── [optional] icon (16px, hidden by default)
  │     │     │     ├── Title text (14/600 $T1, fill_container)
  │     │     │     └── Close icon (12×12 path)
  │     │     └── Description (12/400 $T1)
  │     └── .Action (HORIZONTAL)
  │           ├── Step counter "1/3" (12/600, optional)
  │           └── Button "Got It" (12/600, cornerRadius: 14, height: 28, padding: [5,16], stroke: $static_Black 1px)
  └── .Arrow-down (if arrow on bottom)
```

### Size Variants

| Size | Width | Use for |
|------|-------|---------|
| Min | 160 | Short text, single line |
| Default | 200 | Standard tooltip |
| Max | 264 | Long descriptions |

### Arrow Triangle

Path geometry: `M4 0l4 6-8 0 4-6z` (12×6, fill: `$Bg_Card`)

Arrow-down: same path with `rotation: 180, flipX: true`.

### Arrow Alignment

| Position | Arrow padding |
|----------|--------------|
| Left | `paddingLeft: 16` |
| Center | `alignItems: "center"`, `paddingLeft/Right: 16` |
| Right | `alignItems: "end"`, `paddingRight: 16` |

### Close Icon (12×12)

Path geometry: `M11.6066 13.02081c0.39052 0.39052 1.02369 0.39052 1.41422 0 0.39052-0.39053 0.39052-1.02369 0-1.41421l-4.94967-4.94966 4.94981-4.94981c0.39052-0.39052 0.39052-1.02369 0-1.41421-0.39053-0.39052-1.02369-0.39052-1.41422 0l-4.9498 4.9498-4.94983-4.94983c-0.39052-0.39052-1.02369-0.39052-1.41422 0-0.39052 0.39052-0.39052 1.02369 0 1.41422l4.94983 4.94983-4.94969 4.94969c-0.39052-0.39052 0.39052-1.02369 0-1.41421 0.39052-0.39052 1.02369-0.39052 1.41422 0l4.94969-4.94969 4.94966 4.94966z`

(Or use library `icon_close` ref `ZRrl1` at 12×12 size)

---

## Inputs [instance + spec]

Artboard: `k56FD` ("Inputs")

### Input_Default (with label header)

Full input with `.Input Header` (label + optional helper) → `.1_Input Field` → `.Input Footer` (message, hidden).
361px width, gap 8 between sections. All `reusable: true`.

| Name | ID | Field Height | Description |
|------|----|-------------|-------------|
| Input_Default_48 | `uUqqa` | 48px | Standard input with label |
| Input_Default_40 | `VjdSh` | 40px | Compact input with label |

**Structure:**
- `.Input Header`: Label text (14/600 `$T1`) + optional helper area (dropdown, icon)
- `.1_Input Field`: cornerRadius 8, fill `$Bg_Card` (#1E1F24), padding [0,12]
  - Typing Area: placeholder text (14/400 `$T3`), filled text (14/400 `$T1`)
  - Name suffix: text "BTC" (14/400 `$T1`)
- `.Input Footer` (hidden by default): message text (14/400 `$T2`), pair info rows

### Input_Compact (no label header)

Input field only, no header label. `.2_Input Field` → `.Input Footer` (hidden).
All `reusable: true`.

| Name | ID | Field Height | Description |
|------|----|-------------|-------------|
| Input_Compact_48 | `hBK8V` | 48px | No-label input |
| Input_Compact_40 | `nl1tg` | 40px | No-label compact input |

**Structure:**
- `.2_Input Field`: cornerRadius 8, fill `$Bg_Card`, padding [5,12], gap 8
  - Optional Icon Before (hidden)
  - Typing Area: placeholder "Price" (14/400 `$T3`), value text (14/400 `$T1`)
  - Name/Group: suffix text "USDT" (14/600 `$T1`) + optional action icons

### State Spec (apply to any instance)

| State | Border | Text | Notes |
|-------|--------|------|-------|
| Default | none | placeholder `$T3` | Base state |
| Filled | none | value `$T1` | Has typed content |
| Typing | `stroke: $T1 1px` (center) | value `$T1` | Active cursor |
| Error | `stroke: #F63649 1px` (center) | value `$T1` | Show `.Input Footer` with red message |
| Read Only | none | value `$T1` | Non-interactive |
| Disable | none, `opacity: 0.4` | placeholder `$T3` | Non-interactive |

### Override Keys

| Key | Replaces |
|-----|----------|
| `"Input Label"` | Header label text |
| `"Input"` / `"Price"` | Placeholder text |
| `"BTC"` / `"USDT"` | Suffix text |
| `"Message"` | Footer message |

---

## Textarea [instance + spec]

Artboard: `k56FD` ("Inputs")

### Textarea (with label header)

Multi-line text input with `.Input Header` (label + optional helper) → `.text Area` (96px height).
343px width (text area), gap 8. `reusable: true`.

| Name | ID | Area Height | Description |
|------|----|-------------|-------------|
| Textarea | `aWP8N` | 96px | Multi-line text area with label + char count |

**Structure:**
- `.Input Header` (`0e0Rv`): Same structure as Input_Default — Label text (14/400 `$T1`) + optional helper area (dropdown, icon). All header icons hidden by default.
- `.text Area` (`X1GYL`): cornerRadius 8, fill `$Bg_Card`, padding [12,16], gap 8, `justifyContent: space_between`, layout vertical
  - Text content: placeholder (16/400 `$T3`), filled text (16/400 `$T1`), `textGrowth: fixed-width-height`, `fill_container`
  - `.text_length_limit` (`sVQ3y`): "0" (12/400 `$T2`) + "/99" (12/400 `$T3`), aligned bottom-right

### State Spec (apply to Textarea)

| State | Border | Text | Notes |
|-------|--------|------|-------|
| Default | none | placeholder `$T3` | Base state |
| Filled | none | value `$T1` | Has typed content |
| Typing | `stroke: $T1 1px` (center) | value `$T1` | Active cursor, fill `#141414` |
| Error | `stroke: #F63649 1px` (center) | value `$T1` | fill `#141414`, show error message below (14/400 `$Red`) |
| Disable | none | placeholder `$T3` | Same as Default visually |

### Override Keys

| Key | Replaces |
|-----|----------|
| `"Input Label"` | Header label text |
| `"Text"` | Placeholder / content text |
| `"0"` | Current character count |
| `"/99"` | Max character limit |
| `"Message"` | Error message (add below .text Area) |

---

## Search [instance]

Artboard: `k56FD` ("Inputs")

32px height, 393px width. Pill-shaped search bar (cornerRadius 50). All `reusable: true`.
`icon_search` ref `v4jgi` (16px, fill `$T3`). `icon_close` ref `ZRrl1` (16px, fill `$T3`).

| Name | ID | Cancel | Border | Close | Caret | Text |
|------|----|--------|--------|-------|-------|------|
| Search_Default | `P69q3` | hidden | none | hidden | hidden | placeholder `$T3` |
| Search_Cancel | `hkwwo` | visible | none | hidden | hidden | placeholder `$T3` |
| Search_Focused | `34FQ1` | visible | `$T1` 1px center | hidden | visible `$Brand` | placeholder `$T3` |
| Search_Input | `FK98y` | visible | `$T1` 1px inside | visible | visible `$Brand` | value `$T1` |
| Search_Filled | `O9dWU` | visible | none | visible | hidden | value `$T1` |

### Structure

- **Search Bar**: cornerRadius 50, fill `$Bg_Card`, height 32, padding [5,12], gap 8–10
  - `icon_search` (ref `v4jgi`, 16px, fill override `$T3`)
  - `Caret` (line, width 0, height 16, stroke `$Brand` 1px)
  - `Search text`: 14/400
  - `icon_close` (ref `ZRrl1`, 16px, fill override `$T3`)
- **Cancel** text: 12/400 `$T3`

### Override Keys

| Key | Replaces |
|-----|----------|
| `"Placeholder"` / `"Search text"` / `"Input Text"` / `"Filled"` | Search text |
| `"Cancel"` | Cancel button text |
