#!/bin/bash

# Code Quality Check Script
# This script runs linting, type checking, and integration tests on the codebase

set -e  # Exit on any error

echo "🔍 Running code quality checks..."
echo

# Ruff - Fast Python linter and formatter
echo "📋 Running Ruff linter..."
uv run ruff check .
echo "✅ Ruff check completed"
echo

# Pylint - Comprehensive Python linter
echo "🔧 Running Pylint on agent module..."
uv run pylint agent/ --rcfile=pyproject.toml
echo "✅ Pylint agent check completed"
echo

echo "🔧 Running Pylint on logger..."
uv run pylint logger/ --rcfile=pyproject.toml
echo "✅ Pylint logger check completed"
echo

echo "🔧 Running Pylint on rust_tools..."
uv run pylint rust_tools/ --rcfile=pyproject.toml
echo "✅ Pylint rust_tools check completed"
echo

echo "🔧 Running Pylint on workflow_new..."
uv run pylint workflow_new/ --rcfile=pyproject.toml
echo "✅ Pylint workflow_new check completed"
echo

# Unit Tests - No API keys required
echo "🧪 Running unit tests..."
uv run pytest tests/ -v
echo "✅ Unit tests completed"
echo

echo "🔧 Running Pylint on evaluation..."
uv run pylint evaluation/ --rcfile=pyproject.toml
echo "✅ Pylint evaluation check completed"
echo

# Integration Tests - Real API calls (requires .env with API keys)
echo "🌐 Running integration tests..."
uv run pytest tests/ --integration -v
echo "✅ Integration tests completed"
echo

echo "🎉 All code quality checks and tests passed!"