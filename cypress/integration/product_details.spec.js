/// <reference types="cypress" />




describe('jungle-rails app product page', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test

    cy.visit('http://localhost:3000')
  })

  it("Goes to the product page", () => {
    cy.get("article a").first().click()
    cy.url().should('include', '/products/')
  });

})
