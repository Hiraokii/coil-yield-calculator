# 🧮 Coil Yield Calculator

> **English** | [日本語](#日本語)

---

## English

### Overview

**Coil Yield Calculator** is a mobile application built with Flutter, designed for professionals working in manufacturing and metal stamping processes.

It calculates the **estimated number of parts** that can be produced from a metal coil, based on key physical parameters. This helps production teams quickly estimate output and plan material usage efficiently.

---

### Features

- 📐 **Yield Calculation** — Estimates the number of parts from a coil based on outer diameter, inner diameter, material thickness, and pitch (part spacing).
- 🕒 **Calculation History** — Stores previous calculations locally so you can review and compare past results.
- ⚙️ **Settings** — Customize application preferences to fit your workflow.
- 🎨 **Clean UI** — Modern dark-themed interface with smooth animations for a fast, intuitive experience.

---

### How the Calculation Works

The app uses the standard coil length formula to estimate total material length, then divides by the pitch to obtain the part count:

```
Coil Length (mm) = π × (OD² - ID²) / (4 × thickness)
Number of Parts  = Coil Length / Pitch
```

**Parameters:**

| Parameter | Description |
|---|---|
| Outer Diameter (OD) | External diameter of the coil (mm) |
| Inner Diameter (ID) | Internal/core diameter of the coil (mm) |
| Thickness | Material thickness (mm) |
| Pitch | Distance between each part on the strip (mm) |

---

### Tech Stack

- **Framework:** Flutter (Dart)
- **State Management:** BLoC / Cubit
- **Architecture:** Clean Architecture (Domain, Data, Presentation layers)
- **Local Storage:** SQLite (via local repository)
- **Platforms:** iOS & Android

---

### Getting Started

```bash
# Clone the repository
git clone https://github.com/Hiraokii/coil-yield-calculator.git

# Navigate to the project directory
cd coil_yield_calculator

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

## 日本語

### 概要

**Coil Yield Calculator（コイル歩留まり計算機）** は、製造業およびプレス加工のプロフェッショナル向けに開発されたFlutter製モバイルアプリです。

コイルの物理パラメーターをもとに、**生産可能な部品数を自動で見積もる**ことができます。生産チームが材料使用量を迅速に把握し、効率的な生産計画を立てるのに役立ちます。

---

### 主な機能

- 📐 **歩留まり計算** — 外径・内径・板厚・ピッチ（部品間隔）を入力するだけで、コイルから取れる部品数を自動計算します。
- 🕒 **計算履歴** — 過去の計算結果をローカルに保存し、いつでも確認・比較できます。
- ⚙️ **設定** — ワークフローに合わせてアプリの設定をカスタマイズできます。
- 🎨 **モダンなUI** — スムーズなアニメーションを備えたダークテーマの直感的なインターフェース。

---

### 計算方法

コイルの全長を算出する標準的な計算式を用い、その結果をピッチで割ることで部品数を導きます。

```
コイル全長 (mm) = π × (外径² - 内径²) / (4 × 板厚)
部品数 = コイル全長 ÷ ピッチ
```

**パラメーター説明：**

| パラメーター | 説明 |
|---|---|
| 外径 (OD) | コイルの外側の直径 (mm) |
| 内径 (ID) | コイルの内側（芯）の直径 (mm) |
| 板厚 | 材料の厚さ (mm) |
| ピッチ | ストリップ上の部品間の距離 (mm) |

---

### 技術スタック

- **フレームワーク:** Flutter (Dart)
- **状態管理:** BLoC / Cubit
- **アーキテクチャ:** クリーンアーキテクチャ（ドメイン・データ・プレゼンテーション層）
- **ローカルストレージ:** SQLite（ローカルリポジトリ経由）
- **対応プラットフォーム:** iOS・Android

---

### セットアップ

```bash
# リポジトリをクローン
git clone https://github.com/Hiraokii/coil-yield-calculator.git

# プロジェクトディレクトリへ移動
cd coil_yield_calculator

# 依存関係をインストール
flutter pub get

# アプリを起動
flutter run
```

---

*Built with ❤️ using Flutter — © 2026 Hiraokii*
