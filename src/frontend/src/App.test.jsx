import { render, screen } from '@testing-library/react';
import React from 'react';
import { describe, it, expect } from 'vitest';
import App from './App';

describe('Frontend App Component', () => {
  it('renders DevSecOps Enterprise Dashboard header', () => {
    render(<App />);
    const heading = screen.getByText(/DevSecOps Enterprise Dashboard/i);
    expect(heading).toBeDefined();
  });
});
