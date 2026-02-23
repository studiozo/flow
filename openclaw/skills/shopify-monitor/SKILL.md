# Shopify Store Monitor

## Description
Monitor the ZØ Studio Shopify store for new orders, low inventory, and revenue tracking.

## Triggers
- "check shopify", "store status", "new orders", "revenue today", "inventory check"
- Heartbeat: runs daily at 8 AM as part of the morning briefing

## Actions

### New Orders
Query the Shopify Admin API for orders created since last check.
Format: Order #, customer name, items, total, fulfillment status.

### Revenue Summary
Pull daily/weekly/monthly revenue totals.
Compare to previous period and flag significant changes (>20% up or down).

### Low Inventory Alert
Check all active products. Alert if any variant has fewer than 5 units in stock.

### Product Update
When asked to update a product, modify via Admin API:
- Title, description, pricing, images, tags, SEO metadata.
- Always confirm changes before submitting.

## Environment Variables Required
- `SHOPIFY_STORE_URL`
- `SHOPIFY_ADMIN_API_TOKEN`

## Safety
- READ operations are autonomous
- WRITE operations (product updates, inventory changes) require human confirmation
- NEVER process payments or modify checkout settings autonomously
