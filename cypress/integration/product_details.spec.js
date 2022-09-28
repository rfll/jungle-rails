/// <reference types="cypress" />




describe('jungle-rails app product page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it("Goes to the product page", () => {
    cy.get("article a").first().click()
    cy.url().should('include', '/products/')
  });

})
