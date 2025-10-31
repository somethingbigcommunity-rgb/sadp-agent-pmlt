<!---
  Use this template when making consequential changes to the `/models` directory,
  including changes to dbt models, tests, seeds, and docs.
--->

## Solution

Describe the solution. Include links to any related MRs and/or issues.

## Submitter Checklist

### Testing - any exceptions must be noted

- [ ] Every model should be tested (see [dbt testing guide])
- [ ] Every model should be documented. We recommend to use Docs Blocks in order to easily write multiline documentation (see [dbt doc blocks])
- [ ] Main columns should have a description
- [ ] Check the GitHub Action result. The GitHub Action runs a `dbt build` on your projec. That means all the models and all the tests will be run and then tested. To check the results, you just need to follow the process explained below:

![Github Action](https://confluence.keringapps.com/download/attachments/716903377/github_action.gif)

In the short GIF above, all runs and tests are passing, so the output doesn't show any error or warning.

<details>
<summary> dbt Test Results </summary>

<pre><code>

Paste the results of dbt test here.

</code></pre>

</details>

#### Style & Structure: Best practice

We created a first version of a [Kering style guide]. This is a first attempt to align all teams and we are also open to any modification since the intent is to create with the different teams a common vision.

- [ ] Field names should all be lowercased.
- [ ] Function names should all be capitalized.
- [ ] All references to existing tables/views/sources (i.e. `{{ ref('...') }}` statements) should be placed in CTEs at the top of the file.

## All PR Checklist

- [ ] Latest Github actions passed.
  - [ ] If not, an explanation has been provided in testing section of this MR.
- [ ] This PR is ready for final review and merge.
- [ ] Assigned to reviewer.

## Reviewer Checklist

- [ ] Every model should be tested
- [ ] Every model should be documented

[Kering style guide]: https://confluence.keringapps.com/x/ci2FKg
[dbt testing guide]: https://www.getdbt.com/analytics-engineering/transformation/data-testing/
[dbt doc blocks]: https://docs.getdbt.com/docs/collaborate/documentation#using-docs-blocks
